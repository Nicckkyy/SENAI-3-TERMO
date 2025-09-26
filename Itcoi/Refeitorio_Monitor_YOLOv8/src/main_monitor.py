import cv2
import numpy as np
from ultralytics import YOLO

# --- 1. CONFIGURAÇÕES GLOBAIS ---
# O caminho para o seu modelo treinado. Estamos usando o modelo COCO padrão (yolov8n.pt)
MODELO_YOLO_PATH = 'models/yolov8n.pt'
VIDEO_SOURCE = 0 # 0 para webcam (correto para o teste)
IOU_LIMIAR = 0.75 # Limiar de IOU para considerar a cadeira "ocupada"

# Coordenadas da Linha de Contagem (para Tráfego de Entrada)
LARGURA_FRAME = 1280
ALTURA_FRAME = 720
LINHA_CONTAGEM = (50, ALTURA_FRAME // 2, 100, ALTURA_FRAME // 2)

# --- CONFIGURAÇÃO CORRIGIDA DO ID DE CLASSES (USANDO COCO) ---
# O modelo yolov8n.pt usa a convenção COCO, onde 'person' é 0 e 'chair' é 56.
ID_PESSOA = 0   
ID_CADEIRA = 56 
# -------------------------------------------------------------

# Variáveis de Contagem
contador_entrada = 0
historico_ids_entrada = set() # Para garantir que cada pessoa seja contada apenas uma vez


# --- 2. FUNÇÃO IOU (Intersection Over Union) ---
def calcular_iou(box1, box2):
    """Calcula o IOU entre duas caixas delimitadoras (bounding boxes)."""
    # box: [x_min, y_min, x_max, y_max]
    
    # Coordenadas da intersecção
    x_a = max(box1[0], box2[0])
    y_a = max(box1[1], box2[1])
    x_b = min(box1[2], box2[2])
    y_b = min(box1[3], box2[3])

    # Área da intersecção
    inter_area = max(0, x_b - x_a) * max(0, y_b - y_a)

    # Área das caixas individuais
    box1_area = (box1[2] - box1[0]) * (box1[3] - box1[1])
    box2_area = (box2[2] - box2[0]) * (box2[3] - box2[1])

    # Área da união
    union_area = float(box1_area + box2_area - inter_area)

    # Cálculo final do IOU
    if union_area == 0:
        return 0
    return inter_area / union_area

# --- 3. FUNÇÃO DE RASTREAMENTO E CONTAGEM DE TRÁFEGO ---
def rastrear_e_contar_entrada(id_rastreio, bbox, linha_y):
    """Rastreia a pessoa e conta a entrada ao cruzar a linha virtual."""
    global contador_entrada, historico_ids_entrada

    # Coordenada Y central da caixa delimitadora da pessoa
    centro_y = (bbox[1] + bbox[3]) // 2
    
    # Assumindo que a linha de contagem é horizontal (LINHA_CONTAGEM[1] é y1)
    if centro_y < linha_y and id_rastreio not in historico_ids_entrada:
        historico_ids_entrada.add(id_rastreio)
        contador_entrada += 1

# --- 4. FLUXO PRINCIPAL ---
def monitorar_refeitorio():
    global contador_entrada

    # Carregar o modelo YOLOv8
    try:
        model = YOLO(MODELO_YOLO_PATH)
    except Exception as e:
        print(f"ERRO: Não foi possível carregar o modelo YOLOv8. Verifique o caminho: {MODELO_YOLO_PATH}")
        print(f"Detalhes do erro: {e}")
        return

    # A verificação de classes foi movida para o topo, pois os IDs são fixos (COCO)
    # NÃO É NECESSÁRIO REPETIR O MAPEAR AQUI.

    # Inicializar a captura de vídeo
    cap = cv2.VideoCapture(VIDEO_SOURCE)
    if not cap.isOpened():
        print("ERRO: Não foi possível abrir a fonte de vídeo.")
        return

    print("Monitoramento iniciado. Pressione 'q' para sair.")
    
    linha_y_contagem = LINHA_CONTAGEM[1] # Apenas a coordenada Y da linha horizontal

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            break
        
        # 1. Redimensionar o frame para consistência (Opcional, mas recomendado)
        frame = cv2.resize(frame, (LARGURA_FRAME, ALTURA_FRAME))
        
        # 2. Executar a detecção e o rastreamento (tracking)
        # Usamos o rastreamento 'bytetrack' integrado para obter IDs únicos
        results = model.track(frame, persist=True, tracker="bytetrack", verbose=False)

        # Listas para armazenar as caixas delimitadoras
        pessoas_boxes = []
        cadeiras_boxes = []
        
        # Verificar se há resultados válidos
        if results and results[0].boxes:
            boxes = results[0].boxes
            
            # Iterar sobre as detecções e separar por classe
            for box in boxes:
                cls = int(box.cls[0])
                bbox = box.xyxy[0].cpu().numpy().astype(int)
                
                # A classificação agora usa os IDs COCO fixos definidos no topo do código
                if cls == ID_PESSOA:
                    # Inclui o ID de rastreamento (track_id) se existir
                    track_id = int(box.id[0]) if box.id is not None else -1
                    pessoas_boxes.append((bbox, track_id))
                    
                    # Chamada para contagem de pessoas que entraram (tráfego)
                    if track_id != -1:
                        rastrear_e_contar_entrada(track_id, bbox, linha_y_contagem)

                elif cls == ID_CADEIRA:
                    cadeiras_boxes.append(bbox)

        # 3. Lógica de IOU para Ocupação
        
        num_cadeiras_ocupadas = 0
        num_cadeiras_vazias = 0
        cadeiras_ocupadas_indices = set() # Guarda o índice da cadeira que está ocupada

        # Iterar sobre CADEIRAS e verificar a sobreposição com PESSOAS
        for i, c_box in enumerate(cadeiras_boxes):
            is_occupied = False
            for p_box, _ in pessoas_boxes:
                # O p_box (pessoa) é [xmin, ymin, xmax, ymax], o c_box (cadeira) também
                iou = calcular_iou(c_box, p_box)
                
                if iou >= IOU_LIMIAR:
                    # A regra foi satisfeita! Cadeira Ocupada.
                    is_occupied = True
                    cadeiras_ocupadas_indices.add(i)
                    break
            
            # Contagem final
            if is_occupied:
                num_cadeiras_ocupadas += 1
                cor_cadeira = (0, 0, 255)  # Vermelho para Ocupada
            else:
                num_cadeiras_vazias += 1
                cor_cadeira = (0, 255, 0)  # Verde para Vazia

            # 4. Desenhar os resultados na tela (apenas Cadeiras)
            
            # Desenha a caixa da Cadeira
            cv2.rectangle(frame, (c_box[0], c_box[1]), (c_box[2], c_box[3]), cor_cadeira, 2)
            
            # Adiciona o rótulo
            rotulo = "OCUPADA" if is_occupied else "VAZIA"
            cv2.putText(frame, rotulo, (c_box[0], c_box[1] - 10), 
                        cv2.FONT_HERSHEY_SIMPLEX, 0.5, cor_cadeira, 2)

        # Desenha a Linha de Contagem (Tráfego)
        cv2.line(frame, (LINHA_CONTAGEM[0], LINHA_CONTAGEM[1]), 
                        (LINHA_CONTAGEM[2], LINHA_CONTAGEM[3]), (255, 0, 0), 2)
        cv2.putText(frame, "Linha de Entrada", (LINHA_CONTAGEM[0], LINHA_CONTAGEM[1] - 10), 
                        cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 0, 0), 2)


        # 5. Exibir os Contadores Finais
        
        # Pessoas no Alcance (Todas as pessoas detectadas, independente de ocuparem cadeira)
        pessoas_no_alcance = len(pessoas_boxes) 
        
        # Texto de Resultados
        cv2.putText(frame, f"1. Pessoas no Refeitorio: {pessoas_no_alcance}", (10, 30), 
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)
        cv2.putText(frame, f"2. Trafego de Entrada: {contador_entrada}", (10, 60), 
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (255, 255, 255), 2)
        cv2.putText(frame, f"3. Cadeiras Ocupadas: {num_cadeiras_ocupadas}", (10, 90), 
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 255), 2)
        cv2.putText(frame, f"4. Cadeiras Vazias: {num_cadeiras_vazias}", (10, 120), 
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)

        # Exibir o frame
        cv2.imshow('Monitoramento de Refeitorio', frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

# --- Inicia a execução ---
if __name__ == "__main__":
    monitorar_refeitorio()
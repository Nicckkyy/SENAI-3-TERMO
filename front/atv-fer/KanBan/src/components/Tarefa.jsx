import React from "react";
import { useDraggable } from "@dnd-kit/core"; // Hook de arrastar importado corretamente
import "../styles/Tarefa.scss";

// O componente Tarefa deve receber a tarefa individual como prop
export default function Tarefa({ tarefa, atualizarStatus }) {
  // A ID do Draggable deve ser o ID da tarefa, e não a tarefa inteira
  const { attributes, listeners, setNodeRef, transform } = useDraggable({
    id: tarefa.id,
  });

  // Estilo para o efeito de arraste
  const style = transform
    ? { transform: `translate3d(${transform.x}px, ${transform.y}px, 0)` } // Ajuste de sintaxe no transform
    : undefined;

  // Função para determinar a cor da barra lateral (exemplo)
  const getPrioridadeColor = (prioridade) => {
    switch (prioridade) {
      case "alta":
        return "#dc3545"; // Vermelho
      case "media":
        return "#ffc107"; // Amarelo
      default:
        return "#17a2b8"; // Azul claro
    }
  };

  return (
    // Aplicação da classe de CARD individual e do DND-Kit
    <div
      className="tarefa-container"
      ref={setNodeRef}
      style={style}
      {...listeners}
      {...attributes}
      role="article"
    >
      {/* Barra de Status Colorida para o visual do card */}
      <div
        className="barra-status"
        style={{ backgroundColor: getPrioridadeColor(tarefa.prioridade) }}
      ></div>

      <div className="conteudo-tarefa">
        <h3 className="titulo-tarefa" id={`tarefa-${tarefa.id}`}>
          ID {tarefa.id} - {tarefa.descricao}
        </h3>

        <p className="detalhe">
          <strong>Prioridade:</strong> {tarefa.prioridade}
        </p>
        <p className="detalhe">
          <strong>Setor:</strong> {tarefa.setor}
        </p>

        <select
          className="btn-status"
          value={tarefa.status}
          // Chamamos a função de atualização do Quadro
          onChange={(e) => atualizarStatus(tarefa.id, e.target.value)}
        >
          <option value="fazer">A Fazer</option>
          <option value="fazendo">Fazendo</option>
          <option value="concluido">Concluído</option>
        </select>
      </div>
    </div>
  );
}

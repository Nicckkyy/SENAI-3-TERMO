import 'dart:io';

void main() {
  String? nomeMotorista;
  String? inputVelocidade;
  double velocidade;
  String? inputOpcao;
  int opcaoPagamento;
  double valorMulta;
  
  // 1. Entrada do nome do motorista
  print('Sistema de Multas de Trânsito');
  print('-----------------------------');
  print('Por favor, digite o nome do motorista:');
  nomeMotorista = stdin.readLineSync();
  
  // Trata o caso de nome nulo ou vazio
  if (nomeMotorista == null || nomeMotorista.trim().isEmpty) {
    nomeMotorista = 'Motorista Desconhecido';
  }

  // 2. Entrada da velocidade (sem validação de erro)
  print('\nDigite a velocidade que o motorista estava (em km/h):');
  inputVelocidade = stdin.readLineSync();
  
  // Converte a string para double, assumindo que a entrada é válida
  velocidade = double.parse(inputVelocidade!); 

  // 3. Classificação da infração e cálculo da multa
  String classificacaoInfracao;
  const int limiteVelocidade = 60;

  if (velocidade <= limiteVelocidade) {
    classificacaoInfracao = 'Sem infração';
    valorMulta = 0.0;
  } else if (velocidade >= 61 && velocidade <= 80) {
    classificacaoInfracao = 'Infração leve';
    valorMulta = 100.0;
  } else if (velocidade >= 81 && velocidade <= 100) {
    classificacaoInfracao = 'Infração média';
    valorMulta = 200.0;
  } else { // velocidade > 100
    classificacaoInfracao = 'Infração grave';
    valorMulta = 400.0;
  }

  // Se não houver infração, o programa termina aqui
  if (valorMulta == 0.0) {
    print('\n----------------------------------------');
    print('Motorista: $nomeMotorista');
    print('Velocidade: ${velocidade.toStringAsFixed(2)} km/h');
    print('Classificação: $classificacaoInfracao');
    print('Nenhuma multa aplicada.');
    print('----------------------------------------');
    return;
  }

  // 4. Menu de pagamento
  print('\n----------------------------------------');
  print('Detalhes da Infração:');
  print('Motorista: $nomeMotorista');
  print('Velocidade: ${velocidade.toStringAsFixed(2)} km/h');
  print('Classificação: $classificacaoInfracao');
  print('Valor da multa: R\$ ${valorMulta.toStringAsFixed(2)}');
  print('----------------------------------------');

  print('\nSelecione a opção de pagamento:');
  print('1 - Pagar à vista (10% de desconto)');
  print('2 - Parcelar em 2x (sem juros)');
  print('3 - Parcelar em 3x (com 10% de juros)');
  inputOpcao = stdin.readLineSync();

  // Converte a string para int, assumindo que a entrada é válida
  opcaoPagamento = int.parse(inputOpcao!);

  // 5. Cálculo final e exibição do resultado com switch
  String formaPagamentoTexto;
  double valorFinal;
  
  switch (opcaoPagamento) {
    case 1:
      valorFinal = valorMulta * 0.90;
      formaPagamentoTexto = 'Pagamento à vista (10% de desconto)';
      print('\n----------------------------------------');
      print('Resumo do Pagamento:');
      print('Opção escolhida: $formaPagamentoTexto');
      print('Valor total a pagar: R\$ ${valorFinal.toStringAsFixed(2)}');
      break;
    case 2:
      valorFinal = valorMulta;
      formaPagamentoTexto = 'Parcelamento em 2x de R\$ ${(valorMulta / 2).toStringAsFixed(2)} (sem juros)';
      print('\n----------------------------------------');
      print('Resumo do Pagamento:');
      print('Opção escolhida: $formaPagamentoTexto');
      print('Valor total a pagar: R\$ ${valorFinal.toStringAsFixed(2)}');
      break;
    case 3:
      valorFinal = valorMulta * 1.10;
      formaPagamentoTexto = 'Parcelamento em 3x de R\$ ${(valorFinal * 1.10 / 3).toStringAsFixed(2)} (com 10% de juros)';
      print('\n----------------------------------------');
      print('Resumo do Pagamento:');
      print('Opção escolhida: $formaPagamentoTexto');
      print('Valor total a pagar: R\$ ${valorFinal.toStringAsFixed(2)}');
      break;
    default:
      print('\n----------------------------------------');
      print('Opção de pagamento inválida.');
      print('----------------------------------------');
      break;
  }
}
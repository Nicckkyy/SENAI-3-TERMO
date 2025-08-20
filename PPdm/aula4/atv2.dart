import 'dart:io';

void main() {
  double valorCompra = 0;
  int formaPagamento = 0;
  bool valorValido = false;
  bool formaPagamentoValida = false;

  // 1. Validação do valor da compra
  do {
    try {
      print('Por favor, digite o valor da compra:');
      // Adicionado ? para indicar que o resultado pode ser nulo
      String? input = stdin.readLineSync(); 

      if (input == null || input.trim().isEmpty) {
        // Lidar com valor nulo ou vazio
        print('Erro: O valor da compra não pode ser nulo ou vazio.');
        continue; // Reinicia o loop
      }

      valorCompra = double.parse(input);

      if (valorCompra <= 0) {
        print('Erro: O valor da compra deve ser maior que zero.');
      } else {
        valorValido = true;
      }
    } on FormatException {
      // Regra 4: Tratar o erro com FormatException
      print('Erro: O valor digitado não é um número válido. Por favor, digite apenas números.');
    } catch (e) {
      // Capturar qualquer outro erro inesperado
      print('Ocorreu um erro inesperado: $e');
    }
  } while (!valorValido);

  // 2. Validação da forma de pagamento
  do {
    print('\nSelecione a forma de pagamento:');
    print('1 - Dinheiro');
    print('2 - Cartão de Débito');
    print('3 - Cartão de Crédito');
    print('4 - Pix');
    
    // Adicionado ? para indicar que o resultado pode ser nulo
    String? input = stdin.readLineSync(); 

    try {
      if (input == null || input.trim().isEmpty) {
        print('Erro: A forma de pagamento não pode ser nula ou vazia.');
        continue; // Reinicia o loop
      }

      formaPagamento = int.parse(input);

      // Regra 3: Se a opção for inválida, repetir a pergunta
      if (formaPagamento >= 1 && formaPagamento <= 4) {
        formaPagamentoValida = true;
      } else {
        print('Erro: Opção de pagamento inválida. Por favor, escolha uma opção de 1 a 4.');
      }
    } on FormatException {
      print('Erro: Por favor, digite um número correspondente à opção.');
    }
  } while (!formaPagamentoValida);

  // Exibição do resumo
  String nomeFormaPagamento;
  switch (formaPagamento) {
    case 1:
      nomeFormaPagamento = 'Dinheiro';
      break;
    case 2:
      nomeFormaPagamento = 'Cartão de Débito';
      break;
    case 3:
      nomeFormaPagamento = 'Cartão de Crédito';
      break;
    case 4:
      nomeFormaPagamento = 'Pix';
      break;
    default:
      nomeFormaPagamento = 'Desconhecida';
  }

  print('\n----------------------------------------');
  print('Resumo da Compra:');
  print('Valor: R\$ ${valorCompra.toStringAsFixed(2)}');
  print('Forma de Pagamento: $nomeFormaPagamento');
  print('----------------------------------------');
}
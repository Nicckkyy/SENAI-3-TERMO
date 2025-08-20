import 'dart:io';

void main() {
  print('Calculadora de Média Salarial');
  print('-----------------------------');

  print('Por favor, digite seu nome:');
  String? nomeUsuario = stdin.readLineSync();
  if (nomeUsuario == null || nomeUsuario.trim().isEmpty) {
    nomeUsuario = 'Usuário Desconhecido';
  }

  print('\nDigite o 1º salário:');
  String? inputSalario1 = stdin.readLineSync();
  double salario1 = double.parse(inputSalario1!);

  print('\nDigite o 2º salário:');
  String? inputSalario2 = stdin.readLineSync();
  double salario2 = double.parse(inputSalario2!);

  print('\nDigite o 3º salário:');
  String? inputSalario3 = stdin.readLineSync();
  double salario3 = double.parse(inputSalario3!);

  double mediaSalarial = (salario1 + salario2 + salario3) / 3;

  String feedback;
  if (mediaSalarial < 2000) {
    feedback = 'A sua média salarial é baixa.';
  } else if (mediaSalarial >= 2000 && mediaSalarial <= 5000) {
    feedback = 'A sua média salarial é regular.';
  } else {
    feedback = 'A sua média salarial é alta!';
  }

  print('\n----------------------------------------');
  print('Nome: $nomeUsuario');
  print('Média salarial: R\$ ${mediaSalarial.toStringAsFixed(2)}');
  print('Feedback: $feedback');
  print('----------------------------------------');
}
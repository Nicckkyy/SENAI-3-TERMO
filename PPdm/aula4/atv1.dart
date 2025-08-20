import 'dart:io';

void main() {
  String? nomeCompleto;

  do {
    print('Por favor, digite seu nome completo:');
    nomeCompleto = stdin.readLineSync();

    if (nomeCompleto == null || nomeCompleto.trim().isEmpty) {
      print('Erro: O nome não pode ser nulo, vazio ou conter apenas espaços.');
      print('Por favor, tente novamente.');
    }
  } while (nomeCompleto == null || nomeCompleto.trim().isEmpty);

  print('Nome cadastrado com sucesso: $nomeCompleto');
}
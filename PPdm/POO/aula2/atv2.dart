import 'dart:io';

void main() {
  ContaCorrente conta1 = ContaCorrente(
    nomeTitular: "João",
    saldoInicial: 1500.0,
    limiteChequeEspecial: 500.0,
  );

  print("=== Conta Corrente ===");
  print("Titular: ${conta1.nomeTitular}");
  print("Saldo: ${conta1.saldoInicial}");
  print("Limite cheque especial: ${conta1.limiteChequeEspecial}");
  print("");

  ContaPoupanca conta2 = ContaPoupanca(
    nomeTitular: "Maria",
    saldoInicial: 2000.0,
    taxaRendimento: 0.05, 
  );

  print("=== Conta Poupança ===");
  print("Titular: ${conta2.nomeTitular}");
  print("Saldo antes do rendimento: ${conta2.saldoInicial}");
  conta2.aplicarRendimento(); 
  print("Saldo após rendimento: ${conta2.saldoInicial}");
}

class Conta {
  String nomeTitular;
  double saldoInicial;
  double? investimento; 

  Conta({
    required this.nomeTitular,
    required this.saldoInicial,
    this.investimento,
  });
}

class ContaCorrente extends Conta {
  double? limiteChequeEspecial;

  ContaCorrente({
    required String nomeTitular,
    required double saldoInicial,
    this.limiteChequeEspecial,
  }) : super(nomeTitular: nomeTitular, saldoInicial: saldoInicial);
}

class ContaPoupanca extends Conta {
  double taxaRendimento;

  ContaPoupanca({
    required String nomeTitular,
    required double saldoInicial,
    required this.taxaRendimento,
  }) : super(nomeTitular: nomeTitular, saldoInicial: saldoInicial);

  void aplicarRendimento() {
    saldoInicial += saldoInicial * taxaRendimento;
  }
}

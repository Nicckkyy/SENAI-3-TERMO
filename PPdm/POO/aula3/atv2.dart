import 'dart:io';

class Pagamento{
  double saldo;
  double? desconto;

  Pagamento({required this.saldo, this.desconto});

  void processar(){
    print("Pagamento pecessado");
  }
}

class Pix extends Pagamento{
  Pix({required double saldo}):super(saldo: saldo);

  @override
  void processar() {
    print("Pagamento realizado no pix com sucesso");
  }
}

class CartaoCredito extends Pagamento{
  CartaoCredito({required double saldo}):super(saldo: saldo);

  @override
  void processar() {
    print("Seu pagamento de crédito foi efetivado ");
  }
}

class Boleto extends Pagamento{
  Boleto({required double saldo}):super(saldo: saldo);

    @override
  void processar() {
    print("Boleto confirmado com sucesso");
  }
}
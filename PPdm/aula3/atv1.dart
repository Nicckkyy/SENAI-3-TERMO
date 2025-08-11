import 'dart:io';

void main (){
  print("Qual o valor da sua compra:");
  double preco = double.parse(stdin.readLineSync()!);

  print("Insira o seu desconto:");
  double desconto = double.parse(stdin.readLineSync()!);

  double contaFinal = calcularDesconto(preco, desconto);
  print("O valor final de sua compra ficou no total de $contaFinal");
}

double calcularDesconto(double preco, double desconto){
  return preco - ((desconto/100) * preco);
}
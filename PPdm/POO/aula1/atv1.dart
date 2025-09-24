import 'dart:io';

void main(){
  Produto produto1 = Produto("Rosas", 5.90, 2);
  produto1.subtrair_estoque();
  produto1.subtrair_estoque();
  produto1.subtrair_estoque();
  produto1.subtrair_estoque();
  
}

class Produto{
  String nome;
  double preco;
  int estoque;

  Produto(this.nome, this.preco, this.estoque);

  void subtrair_estoque(){
    if(estoque > 0){
      estoque --;
      print("Unidade sendo retirada. Estoque atual de $nome: $estoque");
    } else {
      print("🚨 estoque esgotado. As $nome acabaram, escolha outro produto");
    }
  }
}
import 'dart:io';

class Produto{
  String nome = "";
  double preco = 0.0;
  String? descriao; // a ? é usada para determoinar que o dado pode não ter dados - pode ser null
  
  Produto({required this.nome, required this.preco, this.descriao}); // {} junto a required torna os atributos obrigátorios durante a criação do construtor

}

void main(){

  //como descrição é um campo opcional, este campo durante a determinação do produto (objeto)
  //deve ser inserido manualmente - autocomplit não da complit com esse campo

  Produto CocaCola = Produto(nome: "Coquinha trincando", preco: 50);
  Produto Pepsi = Produto(nome: "Pepsi Geladinha", preco: 50, descriao: "Experimente com Limão");

}
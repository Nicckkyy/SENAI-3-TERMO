import 'dart:io';

class Animal {
  String nome;
  int idade;

  Animal ({required this.nome, required this.idade});

  void fazerSom(){
    print("Au au");
  }
}

class Cachorro extends Animal{
  Cachorro({required String nome, required int idade}):
  super(nome: nome, idade: idade);
}
class Gato extends Animal{
  Gato({required String nome, required int idade}):
  super(nome: nome, idade: idade);

  @override
  void fazerSom() {
    print("Miau Miau");
  }
}

void main(){
  Cachorro Fergous = Cachorro(nome: "Fergous", idade: 1);
  Fergous.fazerSom();

  Gato Snow = Gato(nome: "Snow", idade: 1);
  Snow.fazerSom();
}
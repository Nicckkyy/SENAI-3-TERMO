import 'dart:io';
void main() {

  Cachorro fergous = Cachorro(nome: "Fergous", idade: 1, raca: "Labrador");
  print(
    "Cachorro: ${fergous.nome}, Idade: ${fergous.idade}, Raça: ${fergous.raca}",
  );
  fergous.fazerSom();

  Gato snow = Gato(nome: "Snow", idade: 1, cor: "Branco com cinza");
  print("Gato: ${snow.nome}, Idade: ${snow.idade}, Cor: ${snow.cor}");
  snow.fazerSom();
}

class Animal {
  String nome;
  int idade;

  Animal({required this.nome, required this.idade});
}

class Cachorro extends Animal {
  String? raca;

  Cachorro({required String nome, required int idade, this.raca})
    : super(nome: nome, idade: idade);

  void fazerSom() {
    print("Au au!");
  }
}

class Gato extends Animal {
  String? cor;

  Gato({required String nome, required int idade, this.cor})
    : super(nome: nome, idade: idade);

  void fazerSom() {
    print("Miau!");
  }
}

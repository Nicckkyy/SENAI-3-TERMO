import 'dart:io';

class Animal {
  String nome;
  String? raca;
  int idade;

  Animal({required this.nome, required this.idade, this.raca});

  void Falar(){
    print("Bixinho falando sua língua");
  }
}

class Cachorro extends Animal{
  Cachorro({required String nome, required int idade, String? raca}):
  super(nome: nome, idade: idade, raca: raca);

  @override
  void Falar() {
    print("Au au");
  }
}

class Gato extends Animal{
  Gato({required String nome, required int idade, String? raca}):
  super(nome: nome, idade: idade, raca: raca);

  @override
  void Falar() {
    print("Miau Miau");
  }
} 

class Papagaio extends Animal{
  Papagaio({required String nome, required int idade, String? raca}):
  super(nome: nome, idade: idade, raca: raca);

  @override
  void Falar() {
    print("Bom dia Cleide");
  }
}

void main (){
  // Cachorro Tobi = Cachorro(nome: "Tobinho", idade: 10, raca: "Poodle médio");
  // Gato Banguela = Gato(nome: "Banguela", idade: 1);
  // Papagaio Loro = Papagaio(nome: "Loro josé", idade: 3, raca: "Verde");
  
  List<Animal> animais = [
    Cachorro(nome: "Tobinho", idade: 10, raca: "Poodle médio"),
    Gato(nome: "Banguela", idade: 1),
    Papagaio(nome: "Loro josé", idade: 3, raca: "Verde"),
  ];

  // List<Animal> animais = [Cachorro, Gato, Papagaio];

  animais.forEach((animal) {
    print("🐾 ${animal.nome} fala:");
    animal.Falar(); 
    print(""); 
  });
}


import 'dart:io';

void main(){
  // Humano Nicole = Humano("Nicole Camacho Rose", "Feminino", 1.59); // criação de objeto da classe
  // print("- ${Nicole.nome} é do genero ${Nicole.genero} e possui ${Nicole.altura} de altura");
 //jonny
  // Humano Jonathan = Humano("Jonathan Brasil de Sousa", "Masculino",1.75);
  // print("- ${Jonathan.nome} é do genero ${Jonathan.genero} e possui ${Jonathan.altura} de altura");
  // // Jonathan.nome = "Jonathan Brasil de Sousa";
  // // Jonathan.genero = "Masculino";
  // // Jonathan.altura = 1.75;
//allison
  // Humano Allison = Humano("Allison Alvez da Silva", "Masculino", 1.65);
  // print("- ${Allison.nome} é do genero ${Allison.genero} e possui ${Allison.altura} de altura");
  // // Allison.nome = "Allison Alvez da Silva";
  // // Allison.genero = "Masculino";
  // // Allison.altura = 1.65;
//ana
  // Humano Ana = Humano("Ana Luiza Sanches", "Feminino", 1.6);
  // print("- ${Ana.nome} é do genero ${Ana.genero} e possui ${Ana.altura} de altura");
  // // Ana.nome = "Ana Luiza Sanches";
  // // Ana.genero = "Feminino";
  // // Ana.altura = 1.6;

 Carro Tempra = Carro("Banco", "Sedan", "Fiat", "1995", 0);
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();
 Tempra.acelerar();

 print(Tempra.velocidade);
}

// class Humano{ // criação de classe em dart, diferente da main, aqui não usamos ()
  // String nome = ""; // atributos
  // String genero = "";
  // double altura = 0.0;
//construtor da classe - determinando os atributos do objeto sem 
  //precisar decretar eles linha a linha no main
//   Humano(this.nome, this.genero, this.altura);
// }

class Carro{
  String cor = "";
  String modelo = "";
  String marca = "";
  String ano = "";
  double velocidade = 0.0;

  Carro(this.cor, this.modelo, this.marca, this.ano, this.velocidade);

  void acelerar(){
    velocidade += 10;
  }
}
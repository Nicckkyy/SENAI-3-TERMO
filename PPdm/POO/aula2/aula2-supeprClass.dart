import 'dart:io';

//classe mãe (Super class)
class Veiculo{
  String name; // não tem a nescessidade de ser inicializada, pois tera um dado obrigatóriamente
  String modelo;
  int? qt_rodas; //campo opcional com o ?

  Veiculo({required this.name, required this.modelo, this.qt_rodas}); // contrutor junto ao {} e required 
}

//classe filha
class Carro extends Veiculo{
  Carro({required String nome, required String modelo, int? qt_rodas}):
  super(name: nome, modelo: modelo, qt_rodas: qt_rodas);
  // passamos um construtor, que precisa conter os tipos dos atributos recebidos da classe mãe (carro)
  //no super, aribuimos um atributo ao valor que ele recebe -  name: nome (: usado como o intuido de receber um valor)
}

class Moto extends Veiculo{
  Moto({required String nome, required String modelo, int? qt_rodas}): 
  super(name: nome, modelo: modelo, qt_rodas: qt_rodas);
}

void main(){
  Carro Tempra = Carro(nome: "Tempra", modelo: "sedã ie 8v", qt_rodas: 4);
  Moto motinha = Moto(nome: "Motinha", modelo:  "motinha");
}
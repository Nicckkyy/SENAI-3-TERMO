import 'dart:io';

void main (){
  print("Digite sua idade para verificação");
  int idade = int.parse(stdin.readLineSync()!);

  ehMaiorIdade(idade);
}

bool ehMaiorIdade(int idade){
  if(idade >= 18){
    print("Você é maior de idade");
    return true;

  }else{
    print("Menor de idade boy, vaza");
    return true;
  }
}
// LEMBRETE: sempre usar ; durante código.

import "dart:io"; // comando de import das bibliotecas dart.

//Como o java, esta é a função principal do código. Só funfa com ela 
void main (){
  print("Digite teu nome querid@"); //print primeiro com o imput
  String? nome = stdin.readLineSync(); // variavel depois que guarda o imput
  
  print("Olá querid@ $nome seja bem-vindo"); //segundo print com a resposta do imput
}

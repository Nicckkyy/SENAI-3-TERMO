import 'dart:io';

//------------ exemplo 1
// void main(){
//   print("Digite seu nome ser:");
//   String? champion = stdin.readLineSync()!;
//   while(champion == null || champion.trim().isEmpty){
//     print("Existe um dado nulo ou vazio, tente novamente");
//     champion=stdin.readLineSync()!;
//   }
//   print("Parabens $champion");
// }

//------------ exemplo 2
// void main(){
//   try{
//     print("Digite um numero");
//     int numero = int.parse(stdin.readLineSync()!);
//   }catch(e){
//     print("Seu erro foi $e");
//   }
// }

//------------ exemplo 3
// void main(){
//   try{
//     print("Digite um numero");
//     int numero = int.parse(stdin.readLineSync()!);
//   }catch(e){
//     print("Seu erro foi $e");
//   }finally{
//     print("Encerrando programa");
//   }
// }

//------------ exemplo 4
// void main(){
//   try{
//     print("Digite um numero");
//     int numero = int.parse(stdin.readLineSync()!);
//   }on FormatException{
//     print("Digite apenas um numero");
//   }
// }

//------------ exemplo 5
// void main(){
//   List<int> lista = [1,2,3];
//   try{
//     print(lista[5]);
//   }on RangeError{
//     print("Imprima somente valores que estão no index da lista");
//   }
// }


import 'dart:io';

void main(){
  print("Digite sua nota");
  String? entrada = stdin.readLineSync();
  double nt1 = double.parse(entrada!);

  print("Digite sua 2° nota");
  String? entrada2 = stdin.readLineSync();
  double nt2 = double.parse(entrada2!);

  print("Digite sua 3° nota");
  String? entrada3 = stdin.readLineSync();
  double nt3 = double.parse(entrada3!);

  print("Digite sua 4° nota");
  String? entrada4 = stdin.readLineSync();
  double nt4 = double.parse(entrada4!);

  print("Digite sua 5° nota");
  String? entrada5 = stdin.readLineSync();
  double nt5 = double.parse(entrada5!);  

  double somaNotas = nt1 + nt2 + nt3 + nt4 + nt5;
  double media = somaNotas /5;

  if (media >= 5) {
    print("Você está aprovado! Sua média final é de $media");
  }
  else if (media >= 4 && media <= 5) {
    print("Você está detido. Vai fazer recuperação. Sua média final é de $media");
  }
  else {
    print ("Reprovado cara. Sua média final é de $media");
  }
}

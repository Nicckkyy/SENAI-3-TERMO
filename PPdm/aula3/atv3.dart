import 'dart:io';

void main(){
  print("Qual a temperatura atual meu caro (C°)?");
  double celsius = double.parse(stdin.readLineSync()!);

  print(celsiusParaFahrenheit(celsius));
}

double celsiusParaFahrenheit(double celsius){
  return (celsius*9/5) + 32;
}
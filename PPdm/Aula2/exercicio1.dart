import 'dart:io';
import 'dart:vmservice_io';

void main(){
  List<String> flores = [
    "Rosas", 
    "Tulipas", 
    "Orquídeas", 
    "Lírios", 
    "Margaridas", 
    "Girassóis", 
    "Gérberas", 
    "Violetas"
    ];
    
  // bool condition= false;
  String escolhaUsuario = '', cpf = '', op = '', opPagamento = '';
  double precoFlor = 0, precoFlorTotal = 0, resultado = 0;
  List<String> addFlores = [];

  print("-------- Bem - Vindo a floricultura Dona-Florinda --------\n");
  print("Vejas nossas flores disponiveis");
  for(var flor in flores) {
        print("- $flor");
      } 

  print("Digite seu CPF para continuar a compra");
  cpf = stdin.readLineSync()!;

do {
  print("Qual flor deseja levar hoje?");
  escolhaUsuario = stdin.readLineSync()!;
  print("Qual valor será pago pela(s): $escolhaUsuario?");
  precoFlor = double.parse(stdin.readLineSync()!);
  addFlores.add(escolhaUsuario);
  precoFlorTotal += precoFlor;
  
  
  print("Deseja adiionar mais flores ao seu Buque?\n 1.Sim , 2.Não");
  op = stdin.readLineSync()!;
  switch (op){
    case "1":
      // print("Qual a flor que irá adicionar?");
      // escolhaUsuario = stdin.readLineSync()!;
      // addFlores.add(escolhaUsuario);

      // print("Qual o preço da Flor adicionada?");
      // precoFlor = int.parse(stdin.readLineSync()!);
      // precoFlorTotal +=precoFlor;
      break;

    case "2":
      print("Seu Buque contém as flores:");
      for(var flor in addFlores) {
        print("- $flor");
      } 

      print("O valor total do seu buque ficou em: R\$ $precoFlorTotal");
      break;

    default:
    print("Nehuma das opções válidas forão digitadas. Por Favor, digite uma opção válida!\n");
    op = "1";
  }

} while (op != "2");
  print("Selecione a forma de pagamento da compra do seu buque:\n1.À vista (10% de desconto)\n2.Parcelado no cartão(10% de juros)\n3.Fiado(15% adicionado na próxima compra)");
  opPagamento = stdin.readLineSync()!;

  switch(opPagamento){
    case "1":
      resultado = precoFlorTotal -= 0.1;
      print("Seu buque ficou com o valor final de $resultado");
    break;
    case "2":
    precoFlorTotal += (precoFlorTotal * 0.1);
    print("Seu buque ficou com o valor final de $precoFlorTotal");

    break;
    case "3":
    resultado = precoFlorTotal += 0.15;
    print("Seu buque ficou com o valor final de $resultado");

    break;
    default:
    print("Forma de pagamento inválida. Compra encerrada. Po favor, tente novamente mais tarde.");
  }
}
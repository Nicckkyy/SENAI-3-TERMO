import 'dart:io';

void main(){
  //variaveis
  String op, opPagamento, nome ="", cpf = '';
  int escolhaFlor, escolhaQatd, index = 0;
  double conta, total =0;

  //listas
  List<String> flores = [
    "Rosas", 
    "Tulipas", 
    "Orquídeas - vaso comum", 
    "Lírios", 
    "Margaridas", 
    "Girassóis", 
    "Gérberas", 
    "Violetas - vaso pequeno"
  ];

  List<double> precos = [
    6,90,
    9,90,
    39,90,
    8,90,
    3,90,
    7,90,
    5,90,
    9,90
  ];

  List<int> quantidade = [
    30,
    15,
    8,
    10,
    35,
    12,
    20,
    15
  ];

  List<double> soma = [];
  Map<String, double> carrinho = {};

  //print epresentação de programa
  print("----------- Bem - Vindo a floricultura Dona-Florinda -----------");
  print("\n");

  do {
    print("Informe seu nome para registro:\n");
    nome = stdin.readLineSync()!;

    print("insira seu CPF para o registro $nome");
    cpf = stdin.readLineSync()!;

    if (nome.trim().isEmpty||cpf.trim().isEmpty) {
      print("Valores inválidos, cheque suas credenciais e tente novamente");
    }

  } while (nome.trim().isEmpty||cpf.trim().isEmpty);


  do {
    print("Qual o tipo de serviço que deseja reallizar?\n 1.Escolher flores\n 2.Ver estoque\n 3.Ver carrinho\n 4.Realizar pagamento\n 5.Sair");
    op = stdin.readLineSync()!;

    switch(op){
      case "1":
      for(var flor in flores){
        print("- $flor");
      }
      
      print("Qual será a flor que complementará seu buque? (insira um número entre 1 e 8)\n");
      escolhaFlor = int.parse(stdin.readLineSync()!);
      print("Qual a quantidade das flores escolhidas?");
      escolhaQatd = int.parse(stdin.readLineSync()!);

      //conta dos valores unitários das flores pela quantidade pedida pelo usário
      soma.add(precos[escolhaFlor - 1] * quantidade[escolhaQatd - 1]);
      quantidade[index] -= escolhaQatd; // diminuição da quantidade de produtos dentro do estoque da floricultura
      
      //loop para incrementar imputs do usuário ao map de carrinho
      for(int i = 0; i <flores.length; i++){
        carrinho[flores[i]] = soma[i];
      }
      break;

      case "2":
      for(var quant in quantidade){
        print("Seu estoque atualmente\n - $quant");
      }
      break;

      case "3":
      print("Seu carrinho contém os itens:\n $carrinho");

      case "4":
      for(var total in soma){
        print("Seu carrinho ficou com o total de $total\n");
      }
      print("Selecione a forma de pagamento da compra do seu buque:\n1.À vista (10% de desconto)\n2.Parcelado no cartão(10% de juros)\n3.Fiado(15% adicionado na próxima compra)");
      opPagamento = stdin.readLineSync()!;

      switch(opPagamento){
        case "1":
        conta = total -= 0.1;
        print("Seu buque ficou com o valor final de $conta");
        break;

        case 2:
        total += (total * 0.1);
        print("Seu buque ficou com o valor final de $total");
        break;

        case 3: 
        conta = total += 0.15;
        print("Seu buque ficou com o valor final de $total");
        break;

        default:
        print("Forma de pagamento inválida. Compra encerrada. Po favor, tente novamente mais tarde.");
      }

      case "5":
      print("Saindo...");
      break;

      default:
      print("Nenhuma das opções validas foram escolhidas, tente novamente mais tarde");
    }

  } while (op != 5);
  
}
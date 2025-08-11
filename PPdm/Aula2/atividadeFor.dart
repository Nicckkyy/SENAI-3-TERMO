import 'dart:io';

// -------- exercicio 1
// void main() {
//   // Mensagem de boas-vindas ao usuário.
//   print('--- Simulador de Pagamento de Compras ---');

//   // --- Leitura dos Dados do Usuário ---

//   // Pede e lê o valor total da compra.
//   print('\nPor favor, digite o valor total da compra:');
//   // Lê a linha digitada, remove espaços e converte para double.
//   // O '!' no final assume que o valor não será nulo.
//   double valorTotal = double.parse(stdin.readLineSync()!);

//   // Pede e lê a quantidade de parcelas.
//   print('\nAgora, digite a quantidade de parcelas desejada:');
//   // Lê a linha digitada, remove espaços e converte para int.
//   int quantidadeParcelas = int.parse(stdin.readLineSync()!);

//   // --- Cálculo e Exibição do Relatório ---

//   // Calcula o valor de cada parcela.
//   double valorDaParcela = valorTotal / quantidadeParcelas;

//   print('\n--- Relatório de Parcelamento ---');
//   print('Valor Total: R\$ ${valorTotal.toStringAsFixed(2)}');
//   print('Quantidade de Parcelas: $quantidadeParcelas');
//   print('------------------------------------');

//   // Usa um laço 'for' para iterar do número 1 até a quantidade de parcelas.
//   // Esta é a parte central do exercício.
//   for (int i = 1; i <= quantidadeParcelas; i++) {
//     // Para cada iteração, exibe o número da parcela e seu valor formatado.
//     // 'toStringAsFixed(2)' formata o número para ter sempre duas casas decimais.
//     print('Parcela $i: R\$ ${valorDaParcela.toStringAsFixed(2)}');
//   }

//   print('\n--- Fim do Relatório ---');
// }


// // -------- exercicio 2
// void main() {
//   // --- Configuração Inicial ---

//   // 1. O sistema tem uma lista pronta de nomes.
//   // Você pode adicionar ou remover nomes facilmente aqui.
//   List<String> listaDeAlunos = ["Ana", "Bruno", "Carlos", "Daniela", "Fernanda"];

//   // Variável para contar quantos alunos estão presentes. Começa em zero.
//   int alunosPresentes = 0;

//   print('--- Sistema de Lista de Presença ---');
//   print('Responda com "sim" ou "não".\n');

//   // --- Início da Chamada ---

//   // 2. Para cada nome na lista, o sistema deve perguntar.
//   // Usamos um laço 'for-each' para percorrer cada item da 'listaDeAlunos'.
//   // A cada volta do laço, a variável 'aluno' receberá um nome da lista.
//   for (String aluno in listaDeAlunos) {
//     // Pergunta se o aluno atual está presente.
//     print('A pessoa $aluno está presente? (sim/não)');

//     // Lê a resposta do usuário.
//     // '.toLowerCase()' converte a resposta para letras minúsculas ("Sim", "SIM", "sIm" viram "sim").
//     // Isso torna a verificação mais flexível.
//     String resposta = stdin.readLineSync()!.toLowerCase();

//     // Se a resposta for "sim", incrementamos o contador de presentes.
//     if (resposta == 'sim') {
//       alunosPresentes++; // O mesmo que: alunosPresentes = alunosPresentes + 1;
//     }
//   }

//   // --- Relatório Final ---

//   // 3. No final, mostrar quantos alunos estão presentes.
//   print('\n--- Fim da Chamada ---');
//   print('Total de alunos presentes na sala: $alunosPresentes');
// }


//exercicio 3
// void main() {
//   // Lista fixa com os itens do cardápio
//   List<String> cardapio = [
//     "Hambúrguer - R\$ 12.00",
//     "Batata Frita - R\$ 8.00",
//     "Refrigerante - R\$ 5.00",
//     "Suco - R\$ 6.00",
//     "Milkshake - R\$ 10.00"
//   ];

//   // Exibe cada item numerado com "......."
//   for (int i = 0; i < cardapio.length; i++) {
//     // Divide o item para exibir só o nome antes do " - R$"
//     String nomeItem = cardapio[i].split(' - ')[0];
//     print("${i + 1} - $nomeItem .......");
//   }
// }

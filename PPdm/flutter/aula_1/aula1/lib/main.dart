import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //fornecimento de componentes para a tela
      home: Scaffold( //permite dividir o aplocativo em appbar e conteudo(body)
        appBar: AppBar(title: Text("Esse é meu titulo viu rapaiz"),),

      ),
    ); 
    
  }
}
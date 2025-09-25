import 'package:flutter/material.dart';

void main() {
  runApp(const Contador());
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

//código em dart que segue toda a lógica do sistema do app
class _ContadorState extends State<Contador> {
  int valor = 0; //variavel

  void aumentar() {
    setState(() {
      //altera a variavrel na tela
      valor++;
    });
  }

  void diminuir() {
    setState(() {
      valor--;
    });
  }

  void reset() {
    setState(() {
      valor = 0;
    });
  }

  //código em flutter, para dar uma interface ao nosso código
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //provedor de components
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //divide a tela em nav e body
        appBar: AppBar(
          title: Text(
            "App contador da Nick",
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 8, 54, 111),
          toolbarHeight: 150,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://i0.wp.com/nerdizmo.ig.com.br/wp-content/uploads/2024/01/natureza-nas-obras-do-studio-ghibli.jpg?fit=1400%2C986&ssl=1",
                fit: BoxFit.cover,
                width: 250,
              ),
              Text("${valor.toInt()}", style: TextStyle(fontSize: 80)),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      aumentar();
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      diminuir();
                    },
                    child: Icon(Icons.remove),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    child: Icon(Icons.restore),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

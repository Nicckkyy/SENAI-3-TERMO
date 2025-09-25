import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tela home, Olá meus queridos"),
          centerTitle: true,
          toolbarHeight: 120,
          backgroundColor: Color.fromARGB(255, 219, 104, 241),
        ),
        body: Column(
          // podemos cancelar os primeiros containers, que estão mo eixo y, deixamos apenas o children com seu alinhamento,
          //criamos uma segunda ROW que está no eixo x e colocamos um espaçamento entre os containers para que fiquem em proporções i
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   width: 150, //largura
            //   height: 150, //altura
            //   color: Color.fromARGB(
            //     255,
            //     164,
            //     15,
            //     194,
            //   ), //cor mais prática Colors.(nome da cor) - hexadecimal Color(hexadecimal) - HGBO color: Color.FromRGBO(numeros pro rgb)
            // ),
            // Container(
            //   width: 150, //largura
            //   height: 150, //altura
            //   color: Color.fromARGB(
            //     255,
            //     164,
            //     15,
            //     194,
            //   ), // Colors.(nome da cor) - hexadecimal Color(hexadecimal) - HGBO color: Color.FromRGBO(numeros pro rgb)
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250, //largura
                  height: 250, //altura
                  //cor mais prática Colors.(nome da cor) - hexadecimal Color(hexadecimal) - HGBO color: Color.FromRGBO(numeros pro rgb)
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 164, 15, 194),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250, //largura
                  height: 250, //altura
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 164, 15, 194),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250, //largura
                  height: 250, //altura
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 164, 15, 194),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 250, //largura
                  height: 250, //altura
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 164, 15, 194),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

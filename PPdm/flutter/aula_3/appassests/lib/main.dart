import 'package:appassests/tela2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

//class centralizadora pra navegação de páginas
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TelaHome());
  }
}

//class da tela exibida
class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Assests")),
        body: Center(
          child: Stack(
            children: [
              // Image.network(
              //   "https://i0.wp.com/nerdizmo.ig.com.br/wp-content/uploads/2024/01/natureza-nas-obras-do-studio-ghibli.jpg?fit=1400%2C986&ssl=1",
              // ),
              Image.asset(
                "assets/images/aesthetic-ghibli-tcfowyje586f5cba.jpg",
                width: double.infinity,
                height: double.infinity,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "Esse é a fonte do projeto ghibli",
                      style: TextStyle(fontFamily: "Gabriela"),
                    ),
                    Text(
                      "Texto pela biblioteca do google fonts",
                      style: GoogleFonts.grandHotel(),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tela2()),
                        );
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

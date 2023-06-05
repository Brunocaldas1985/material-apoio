import 'package:flutter/material.dart';

class Argumentos {
int acertos = 0;

Argumentos(this.acertos);

}


class Resultado extends StatelessWidget {

  static const routeName = 'Resultado';

  const Resultado({super.key});
 


  @override
  Widget build(BuildContext context) {

 final argumentos = ModalRoute.of(context)!.settings.arguments as Argumentos;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("quiz Curso de Flutter")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text("Resultado",style: TextStyle(fontSize: 20)),           
                 Center(
                   child: Text("Você acertou\n${argumentos.acertos} de 5\nperguntas",
                   style: TextStyle(fontSize: 20)),
                 ),
                SizedBox(
                   width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado');
                      
                      Navigator.pushNamed(context, 'Quiz');
                    },
                    child: Text('Jogar Novamente', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
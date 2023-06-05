import 'package:appquiz/resultado.dart';
import "package:flutter/material.dart";

import 'quiz_dados.dart';




class Quiz extends StatefulWidget {
  const Quiz({super.key});

 
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 int perguntaNumero = 1;
 int acertos = 0;
 int erros = 0;


  @override
  Widget build(BuildContext context) {
    //quiz.shuffle();

    quiz.forEach((elemento) {

      //print(elemento['respostas']);
      //print(elemento['alternativa_correta']);

      int alternativaCorreta = elemento['alternativa_correta'];
      List respostas = elemento['respostas'];

      String respostaCorreta = elemento['respostas'][alternativaCorreta - 1];
      //print(respostaCorreta);

      respostas.shuffle();
      int i = 1;
      respostas.forEach((elemento) {
        //print(elemento);
        if (elemento == respostaCorreta) {
          alternativaCorreta = i;
        }
        i++;
      });
      elemento['alternativa_correta'] = alternativaCorreta;

  });
   /* List quiz = [
      {
        "pergunta": "Quem descobriu o Brasil?",
        "respostas": [
          "Dom Pedro I",
          "Pedro Alvares Cabral",
          "Tiradentes",
          "Dom Pdro II"
        ],
        "alternativa_correta": 2,
      }
    ];

    quiz.add({
      "pergunta": "Flutter é?",
      "respostas": ["Uma linguagem", "Um aplicativo", "Um SDK", "Um Notebook"],
      "alternativa_correta": 3,
    });
    
    for (int i = 3; i <= 20; i++) {
      quiz.add({
        "pergunta": "Pergunta $i",
        "respostas": [
          "Resposta 1",
          "Resposta 2",
          "Resposta 3",
          "Resposta 4"
        ],
        "alternativa_correta": 1,
        });
    }*/

    print('Dados do Quiz');
    //print(quiz);

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero -1]['alternativa_correta'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          erros++;
        }

       print('acertos totais: $acertos erros totais: $erros');

       if (perguntaNumero == 5) {
          print('Terminou o Quiz');
          Navigator.pushNamed(context, 'Resultado', arguments: Argumentos(acertos));
       } else {
        perguntaNumero++;
       }


      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Quiz Curso de Flutter")),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Text('Pergunta $perguntaNumero de 5',
                        style: TextStyle(fontSize: 20))),
                Text("Pergunta:\n\n" + quiz[perguntaNumero - 1]['pergunta'],
                    style: TextStyle(fontSize: 20)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      respondeu(1);
                      print('pressionado 1');
                    },
                    child: Text(quiz[perguntaNumero - 1]['respostas'][0],
                        style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      respondeu(2);
                      print('pressionado 2');
                    },
                    child: Text(quiz[perguntaNumero - 1]['respostas'][1],
                        style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      respondeu(3);
                      print('pressionado 3');
                    },
                    child: Text(quiz[perguntaNumero - 1]['respostas'][2],
                        style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      respondeu(4);
                      print('pressionado 4');
                    },
                    child: Text(quiz[perguntaNumero - 1]['respostas'][3],
                        style: TextStyle(fontSize: 15)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

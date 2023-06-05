
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Image.asset('assets/images/logo.jpg'),
                SizedBox(
                   width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado');
                      Navigator.pushNamed(context, 'Quiz');
                    },
                    child: Text('Jogar', style: TextStyle(fontSize: 40)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
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
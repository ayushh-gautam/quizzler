import 'package:flutter/material.dart';
import 'package:quiz_app/quizPage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: Colors.black,
      body: QuizApp(),
    );
  }
}

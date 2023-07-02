import 'package:flutter/material.dart';
import 'package:test_app/question_screen.dart';
import 'package:test_app/start_screen.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  @override
  //The initState is called after initialization and runs only once
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

//this is meant to save the choosen answer
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(contex) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 47, 4, 64),
        Color.fromARGB(255, 65, 3, 58),
      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: activeScreen,
    )));
  }
}

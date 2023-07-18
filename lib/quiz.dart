import 'package:flutter/material.dart';
import 'package:test_app/data/questions%20.dart';
import 'package:test_app/question_screen.dart';
import 'package:test_app/start_screen.dart';
import './result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

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

  @override

//this is meant to save the choosen answer
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

//writing a condition that makes you not run out of question
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          chosenAnswers: selectedAnswers,
        );
        //above code stores the selected answer inside resultscreen
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 64, 24, 222),
        Color.fromARGB(255, 13, 1, 26),
      ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
      child: activeScreen,
    )));
  }
}

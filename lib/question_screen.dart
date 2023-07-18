import 'package:flutter/material.dart';
import './answerButton.dart';
import 'package:test_app/data/questions .dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget
        .onSelectAnswer(selectedAnswer); //this give access to the widget class
    //All these will increment the question by1
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex+=;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              //ask mentor to explain code
              ...currentQuestion.getShuffledAnswer().map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      //onTap still takes an anonymous function as main function assigned
                      answerQuestion(
                          answer); //this only executes when the function is triggered
                    });
              })
            ],
          ),
        ));
  }
}

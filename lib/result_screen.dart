import 'package:flutter/material.dart';
import './data/questions .dart';
import './questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  //code below shows a list of map that will take string keys and Objects=any datatype at all
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    //trying to create a number that ouput the correct answers and wrong answeers
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length; //this is because we're looking the numbers not list
    return SizedBox(
      width: double.infinity,
      child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numCorrectQuestion out of $numTotalQuestion Questions correctly!',
                  style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              QuestionsSummary(summaryData),
              const SizedBox(height: 10),
              TextButton(onPressed: () {}, child: const Text('Restart Quiz')),
            ],
          )),
    );
  }
}

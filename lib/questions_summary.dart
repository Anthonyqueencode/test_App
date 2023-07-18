import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    //in the code below i'm mapping an existing list to row
    //the list has been created already in summaryData file here i want it to display in rows
    if (['user_answer'] == ['correct_answer']) {
      FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 198, 121, 215),
          child: Text(
            ((['question_index'] as int) + 1).toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ));
    }
    return SizedBox(
        height: 300,
        child: SingleChildScrollView(
            child: Column(
                children: summaryData.map((data) {
          return Row(
            children: [
              Container(
                height: 40,
                child: FloatingActionButton(
                  backgroundColor: Color.fromARGB(255, 198, 121, 215),
                  onPressed: () {},
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      data['question'] as String,
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      data['correct_answer'] as String,
                      style: TextStyle(color: Color.fromARGB(255, 94, 78, 172)),
                    ),
                    Text(
                      data['user_answer'] as String,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          );
        }).toList())));
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        'asset/image/quiz-logo.png',
        color: Color.fromARGB(150, 255, 255, 255),
      ),
      // Opacity(
      //   opacity: 0.4,
      //   child: Image.asset('asset/image/quiz-logo.png'),
      // ),
      TextButton(
          onPressed: () {},
          child: const Text('Learn Flutter the fun way!',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
    ]);
  }
}

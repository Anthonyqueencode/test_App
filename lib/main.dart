import "package:flutter/material.dart";
import './Quiz.dart';

void main() => runApp(const TestApp());

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Quiz();
  }
}

import 'package:flutter/material.dart';
import 'quiz_page.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizler());
}

class Quizler extends StatelessWidget {
  const Quizler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF819BA4),
        appBar: AppBar(
          shadowColor: Colors.black,
          elevation: 4.0,
          backgroundColor: Colors.blueGrey,
          title: const Center(
            child: Text(
              "Truth Or What!",
              style: TextStyle(
                fontSize: 19.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

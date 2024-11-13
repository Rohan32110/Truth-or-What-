import 'package:flutter/material.dart';

class ElevatedButtons extends StatelessWidget {
  ElevatedButtons(
      {required this.texts, required this.checkingAns, required this.colour});

  final String texts;
  final VoidCallback checkingAns;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colour),
        foregroundColor: MaterialStateProperty.all(const Color(0xFDF9F9FF)),
        fixedSize: MaterialStateProperty.all(const Size(209.0, 43.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        checkingAns();
      },
      child: Text(
        texts,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

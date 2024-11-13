import 'question.dart';

class QuizBrain {
  int _counter = 0;
  final List<Question> _questionBank = [
    Question("Do you like your name?", true),
    Question("Do you like anything more than yourself?", false),
    Question("what does bother you most?", true),
    Question("You like Fruits.", true),
    Question("You like cats.", true),
    Question("You love trees", true),
  ];

  void nextQuestion() {
    if (_counter < _questionBank.length - 1) {
      _counter++;
    }
  }

  bool isFinished() {
    if (_counter == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  String getQuestion() {
    return _questionBank[_counter].questionText;
  }

  bool getAnswer() {
    return _questionBank[_counter].questionAnswer;
  }

  void reset() {
    _counter = 0;
  }
}

import 'question.dart';

class QuizeBrain {
  int _index = 0;
  bool last_question = false;

  List<Question> _questions = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: true),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: false),
  ];

  void nextQuestion() {
    if (_index < _questions.length - 1) {
      _index++;
    } else {
      last_question = true;
    }
  }

  String getQuestion() {
    return _questions[_index].question;
  }

  bool getAnswer() {
    return _questions[_index].answer;
  }
}

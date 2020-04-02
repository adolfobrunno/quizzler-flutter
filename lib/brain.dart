import 'package:quizzler/repository/question_repository.dart';

import 'model/question.dart';

class Brain {
  QuestionRepository _repository;
  int _questionNumber;
  int _score;
  List<Question> _questions;

  Brain() {
    this._repository = new QuestionRepository();
    this._score = 0;
    this._questionNumber = 0;
    this._questions = _repository.getAll();
  }

  List<Question> questions() {
    return _questions;
  }

  bool isCorrect(bool answer) {
    Question question = _questions.elementAt(_questionNumber);
    _questionNumber++;
    if (question.correctAnswer == answer) {
      _score++;
      return true;
    } else {
      return false;
    }
  }

  int score() {
    return this._score;
  }

  Question nextQuestion() {
    return _questions.elementAt(_questionNumber);
  }

  bool hasMoreQuestions() {
    return _questionNumber < _questions.length;
  }

  void clear(){
    this._questionNumber = 0;
    this._score = 0;
  }
}

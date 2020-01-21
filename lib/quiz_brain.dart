import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _correctAnswers = 0;
  int _incorrectAnswers = 0;

  List<Icon> _scoreKeeper = [];

  List<Question> _questions = [
    Question(
      questionText: 'El mofongo tiene chicharron',
      answer: true,
    ),
    Question(
      questionText: 'Isabela no me ama',
      answer: false,
    ),
    Question(
      questionText: 'Demolieron Arcadas',
      answer: true,
    ),
    Question(
      questionText: 'Cristobal Colon descubrio Africa',
      answer: false,
    ),
    Question(
      questionText: 'Las Aguilas son mejores que el Licey',
      answer: false,
    ),
    Question(
      questionText: 'Isabela is the Parchisi Queen',
      answer: true,
    ),
    Question(
      questionText: 'Trujillo murio el 1959',
      answer: false,
    ),
    Question(
      questionText: 'Yo naci el 11 de Febrero de 1997',
      answer: true,
    ),
  ];

  void nextQuestion(BuildContext context) {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: "QUIZ COMPLETE",
        desc: 'Correct: $_correctAnswers - Incorrect: $_incorrectAnswers',
        buttons: [
          DialogButton(
            child: Text(
              "CLOSE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      _questionNumber = 0;
      _correctAnswers = 0;
      _incorrectAnswers = 0;
      _scoreKeeper.clear();
    }
  }

  List<Icon> getScores() {
    return _scoreKeeper;
  }

  void setScore(Icon score, String answer) {
    _scoreKeeper.add(score);
    if (answer == 'correct') {
      _correctAnswers++;
    }
    else if (answer == 'incorrect') {
      _incorrectAnswers++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questions[_questionNumber].answer;
  }
}

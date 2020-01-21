import 'package:flutter/material.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

QuizBrain quizBrain = new QuizBrain();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      home: MyHomePage(title: 'Quizzler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void checkAnswer(bool selectedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (selectedAnswer == correctAnswer) {
        quizBrain.setScore(Icon(Icons.check, color: Colors.green), 'correct');
      } else {
        quizBrain.setScore(Icon(Icons.close, color: Colors.red), 'incorrect');
      }
      quizBrain.nextQuestion(context);
    });
  }

  Expanded quizButton(Color color, String option) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: FlatButton(
          child: Text(
            option,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          color: color,
          onPressed: () {
            if (option == 'True') {
              checkAnswer(true);
            } else if (option == 'False') {
              checkAnswer(false);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            quizButton(Colors.green, 'True'),
            quizButton(Colors.red, 'False'),
            Row(
              children: quizBrain.getScores(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ), // Padding
        ), // SafeArea
      ), // Scaffold
    ); // MaterialApp
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  List<Question> questions = [
    Question(
      q: 'You can lead a cow down stairs but not up stairs.',
      a: false,
    ), // Question
    Question(
      q: 'Approximately one quarter of human bones are in the feet.',
      a: true,
    ), // Question
    Question(
      q: 'A slug\'s blood is green.',
      a: true,
    ) // Question
  ];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber].text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ), // TextStyle
              ), // Text
            ), // Center
          ), // Padding
        ), // Expanded
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ), // TextStyle
              ), // Text
              onPressed: () {
                setState(
                  () {
                    bool correctAnswer =
                        questions[questionNumber].answer == true;

                    if (correctAnswer) {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ), // Icon
                      ); // add
                    } else {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ), // Icon
                      ); // add
                    }

                    if (questionNumber < questions.length - 1) {
                      questionNumber += 1;
                    }
                  },
                ); // setState
              },
            ), // FlatButton
          ), // Padding
        ), // Expanded
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ), // TextStyle
              ), // Text
              onPressed: () {
                setState(
                  () {
                    bool correctAnswer = questions[questionNumber] == false;

                    if (correctAnswer) {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ), // Icon
                      ); // add
                    } else {
                      scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ), // Icon
                      ); // add
                    }

                    if (questionNumber < questions.length - 1) {
                      questionNumber += 1;
                    }
                  },
                ); // setState
              },
            ), // FlatButton
          ), // Padding
        ), // Expanded
        Row(
          children: scoreKeeper,
        ), // Row
      ],
    ); // Column
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

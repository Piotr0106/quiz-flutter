import 'package:flutter/material.dart';
import 'package:quiz_game/quiz_screen.dart';
import 'package:quiz_game/result_screen.dart';
import 'data/questions.dart';
import 'home_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartGame(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionsPage(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultsPage(chosenAnswers: selectedAnswers, onRestartClick: restartGame);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(color: Colors.purple, child: screenWidget),
      ),
    );
  }
}

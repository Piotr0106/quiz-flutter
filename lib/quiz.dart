import 'package:flutter/material.dart';
import 'package:quiz_game/quiz_screen.dart';
import 'home_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen = const QuestionsPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
          body: Container(
              color: Colors.purple,
              child: activeScreen
          ),
        ),
      );
  }

}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'answer_button.dart';
import 'data/questions.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsPage> createState() {
    return _QuestionsPageState();
  }
}

void onPressed() {}

class _QuestionsPageState extends State<QuestionsPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //as wide as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answer, (){
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}

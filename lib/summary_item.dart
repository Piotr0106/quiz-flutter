import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_game/question_identifier.dart';

class SummaryItem extends StatelessWidget{
  const SummaryItem(this.itemData ,{super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer, questionIndex: itemData['question_index'] as int
        ),
        const SizedBox(width:20),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(itemData['user_answer'] as String, style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.orange,
                fontWeight: FontWeight.bold)),
            Text(itemData['correct_answer'] as String, style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold))
          ],
        ))
      ],
    );
  }


}
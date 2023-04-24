import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget{
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() {
    return _QuestionsPage();
  }

}

class _QuestionsPage extends State<QuestionsPage>{
  @override
  Widget build(BuildContext context) {
    return Text("Questions Screen");
  }

}
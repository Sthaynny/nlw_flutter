import 'package:dev_quiz/app/feature/challenge/components/question_indicator.dart';
import 'package:dev_quiz/app/feature/challenge/components/quiz.dart';
import 'package:flutter/material.dart';

class ChalengeScreen extends StatefulWidget {
  ChalengeScreen({Key? key}) : super(key: key);

  @override
  _ChalengeScreenState createState() => _ChalengeScreenState();
}

class _ChalengeScreenState extends State<ChalengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: QuestionIndicatorWidget(),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: QuizWidget(
        title: 'o QUE O FLUTTER FAZ EM SUA TOTALIDADE',
      ),
    );
  }
}

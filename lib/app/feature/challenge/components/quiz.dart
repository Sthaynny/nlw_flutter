import 'package:dev_quiz/app/feature/challenge/components/awnser/awser_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnserWidget(
            title: "Compilados Nativamento",
            isSelected: true,
            isRight: true,
          ),
          AnserWidget(
            title: "Compilados Nativamento",
            isSelected: true,
            isRight: false,
          ),
          AnserWidget(title: "Compilados Nativamento"),
          AnserWidget(title: "Compilados Nativamento"),
          AnserWidget(title: "Compilados Nativamento"),
        ],
      ),
    );
  }
}

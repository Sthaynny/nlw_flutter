import 'package:dev_quiz/app/feature/challenge/components/awnser/awser_widget.dart';
import 'package:dev_quiz/app/shared/components/progress_indicator/progress_indicator.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão 04',
                style: AppTextStyles.body,
              ),
              Text(
                'de 10',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(
            value: 4 / 10,
          ),
        ],
      ),
    );
  }
}

import 'package:dev_quiz/app/shared/components/progress_indicator/progress_indicator.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);
  final int currentPage;
  final int length;

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
                'Questão $currentPage',
                style: AppTextStyles.body,
              ),
              Text(
                'de $length',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(
            value: currentPage / length,
          ),
        ],
      ),
    );
  }
}

import 'package:dev_quiz/app/shared/components/progress_indicator/progress_indicator.dart';
import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
          ),
        ),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 24),
            height: 40,
            width: 40,
            child: Image.asset(
              AppImages.blocks,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24),
            child: Text(
              'Gerenciamento de Estado',
              style: AppTextStyles.heading15,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '10 de 10',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(
                  value: 3 / 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
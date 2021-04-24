import 'package:dev_quiz/app/feature/challenge/components/awnser/awser_widget.dart';
import 'package:dev_quiz/app/shared/models/question_model.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);
  final QuestionModel question;
  final VoidCallback onChange;
  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 64,
            ),
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.awnser.length; i++)
              AnserWidget(
                onTap: () {
                  indexSelected = i;
                  setState(() {});
                  Future.delayed(Duration(seconds: 2)).then(
                    (value) => widget.onChange(),
                  );
                },
                disabled: indexSelected != null,
                awnser: widget.question.awnser[i],
                isSelected: indexSelected == i,
              ),

            // ...widget.question.awnser
            //     .map(
            //       (e) => AnserWidget(
            //         title: e.title,
            //         isRight: e.isRight,
            //       ),
            //     )
            //     .toList(),
          ],
        ),
      ),
    );
  }
}

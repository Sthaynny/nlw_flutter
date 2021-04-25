import 'package:dev_quiz/app/feature/challenge/components/next_button/next_button_widget.dart';
import 'package:dev_quiz/app/feature/challenge/components/question_indicator.dart';
import 'package:dev_quiz/app/feature/challenge/components/quiz/quiz.dart';
import 'package:dev_quiz/app/feature/challenge/controller/challenge_controller.dart';
import 'package:dev_quiz/app/feature/result/result_screen.dart';
import 'package:dev_quiz/app/shared/models/question_model.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class ChalengeScreen extends StatefulWidget {
  ChalengeScreen({Key? key, required this.listQuestions, required this.title})
      : super(key: key);

  @override
  _ChalengeScreenState createState() => _ChalengeScreenState();

  final List<QuestionModel> listQuestions;
  final String title;
}

class _ChalengeScreenState extends State<ChalengeScreen> {
  final controller = ChallengeController();
  final pageController = PageController();
  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      controller.setCurrentPage = pageController.page!.toInt() + 1;
    });
  }

  void get nextPage {
    if (controller.getCurrentPage < widget.listQuestions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linearToEaseOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: AppColors.darkRed,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, child) => QuestionIndicatorWidget(
                  currentPage: controller.getCurrentPage,
                  length: widget.listQuestions.length,
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(86),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.listQuestions
            .map(
              (question) => QuizWidget(
                onSelected: (value) {
                  nextPage;
                  controller.setAnwserRight = true;
                },
                question: question,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (value < widget.listQuestions.length)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Pular",
                      onTap: () => nextPage,
                    ),
                  ),
                if (value == widget.listQuestions.length) SizedBox(width: 7),
                if (value == widget.listQuestions.length)
                  Expanded(
                    child: NextButtonWidget.green(
                      label: "Confirmar",
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              title: widget.title,
                              length: widget.listQuestions.length,
                              result: controller.qtdAnwserRight,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

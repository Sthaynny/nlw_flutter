import 'package:dev_quiz/app/feature/challenge/challenge_screen.dart';
import 'package:dev_quiz/app/feature/home/components/app_bar.dart';
import 'package:dev_quiz/app/feature/home/components/level_button.dart';
import 'package:dev_quiz/app/feature/home/components/quiz_card.dart';
import 'package:dev_quiz/app/feature/home/controller/home_controller.dart';
import 'package:dev_quiz/app/feature/home/controller/home_state.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.stateNotifier.value == HomeState.sucess)
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: 'Fácil',
                  ),
                  LevelButtonWidget(
                    label: 'Médio',
                  ),
                  LevelButtonWidget(
                    label: 'Difícil',
                  ),
                  LevelButtonWidget(
                    label: 'Perito',
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChalengeScreen(
                                  listQuestions: e.questions,
                                  title: e.title,
                                ),
                              ),
                            );
                          },
                          title: e.title,
                          completed:
                              "${e.questionsAnswered} de ${e.questions.length}",
                          percent: e.questionsAnswered / e.questions.length,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
  }
}

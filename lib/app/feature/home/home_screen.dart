import 'package:dev_quiz/app/feature/home/components/app_bar.dart';
import 'package:dev_quiz/app/feature/home/components/level_button.dart';
import 'package:dev_quiz/app/feature/home/components/quiz_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

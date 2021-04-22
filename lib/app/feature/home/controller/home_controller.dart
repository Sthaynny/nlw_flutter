import 'package:dev_quiz/app/feature/home/controller/home_state.dart';
import 'package:dev_quiz/app/feature/home/data/home_repository.dart';
// ignore: unused_import
import 'package:dev_quiz/app/shared/models/awnser_model.dart';
import 'package:dev_quiz/app/shared/models/quiz_model.dart';
import 'package:dev_quiz/app/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier = ValueNotifier(HomeState.empty);
  UserModel? user;
  List<QuizModel>? quizzes;
  final repository = HomeRepositiry();

  set state(HomeState state) => stateNotifier.value = state;

  dispose() {
    stateNotifier.dispose();
  }

  getData() async {
    state = HomeState.loading;
    user = await repository.getUser();
    quizzes = await repository.getQuizzes();
    print(quizzes);
    state = HomeState.sucess;
  }

  Future<void> getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  Future<void> getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    print(quizzes);
    state = HomeState.sucess;
  }
}

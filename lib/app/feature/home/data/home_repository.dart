import 'dart:convert';

import 'package:dev_quiz/app/shared/models/quiz_model.dart';
import 'package:dev_quiz/app/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepositiry {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString('assets/mock/user.json');
    return UserModel.fromJson(response);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString('assets/mock/quizzes.json');
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }
}

import 'dart:convert';

import 'package:dev_quiz/app/shared/models/question_model.dart';

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

extension LevelStringLevel on String {
  Level get levelParse => {
        'facil': Level.facil,
        'medio': Level.medio,
        'dificil': Level.dificil,
        'perito': Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parseString => {
        Level.facil: 'facil',
        Level.medio: 'medio',
        Level.dificil: 'dificil',
        Level.perito: 'perito',
      }[this]!;
}

class QuizModel {
  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.level,
    required this.image,
  });

  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final Level level;
  final String image;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'level': level.parseString,
      'image': image,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'] ?? 0,
      level: (map['level'] as String).levelParse,
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}

import 'package:dev_quiz/app/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

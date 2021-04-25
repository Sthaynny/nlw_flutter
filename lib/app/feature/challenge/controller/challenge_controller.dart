import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int get getCurrentPage => currentPageNotifier.value;
  int qtdAnwserRight = 0;
  set setCurrentPage(int value) => currentPageNotifier.value = value;
  set setAnwserRight(bool value) {
    if (value) {
      qtdAnwserRight++;
    }
  }
}

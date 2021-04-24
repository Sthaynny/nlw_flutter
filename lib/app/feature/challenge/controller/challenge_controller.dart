import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int get getCurrentPage => currentPageNotifier.value;
  set setCurrentPage(int value) => currentPageNotifier.value = value;
}

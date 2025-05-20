import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  String? userMood;

  void setUserMood(String mood) {
    userMood = mood;
    notifyListeners();
  }
}
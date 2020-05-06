import 'package:flutter/material.dart';

// 定义model
class CountModle extends ChangeNotifier {
  int count = 0;

  add() {
    this.count++;
    notifyListeners();
  }
}

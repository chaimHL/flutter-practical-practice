import 'package:flutter/cupertino.dart';

class QYFilterStore extends ChangeNotifier {
  bool _isGlutenFree = false; // 无谷蛋白
  bool _isLactoseFree = false; // 不含乳糖
  bool _isVegan = false; // 素食

  bool get isGlutenFree => _isGlutenFree;

  set isGlutenFree(bool value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  bool get isVegan => _isVegan;

  set isVegan(bool value) {
    _isVegan = value;
    notifyListeners();
  }

  bool get isLactoseFree => _isLactoseFree;

  set isLactoseFree(bool value) {
    _isLactoseFree = value;
    notifyListeners();
  }
}

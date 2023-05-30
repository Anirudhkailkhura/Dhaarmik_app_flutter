
import 'package:flutter/material.dart';

//navigate through the different pages

class MainScreenNotifier extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int newIndex) {
    _pageIndex = newIndex;
    notifyListeners();
  }
}

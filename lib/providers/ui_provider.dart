import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{
  int _selectedScreen = 0;

  int get selectedScreen => _selectedScreen;
  set selectedScreen(int index){
    _selectedScreen = index;
    notifyListeners();
  }
}
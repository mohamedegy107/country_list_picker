import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextDirection textDirectionShared = TextDirection.ltr;

class SettingsProvider extends ChangeNotifier {
  int _selectedScreen = 0;
  int get selectedScreen => _selectedScreen;
  set selectedScreen(int value) {
    _selectedScreen = value;
    notifyListeners();
  }

  bool _isDarkMode = true;
  bool get isDarkMode {
    _isDarkMode
        ? SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent))
        : SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return _isDarkMode;
  }

  set isDarkMode(bool value) {
    _isDarkMode = value;

    notifyListeners();
  }

  TextDirection get textDirection => textDirectionShared;
  set textDirection(TextDirection value) {
    textDirectionShared = value;
    notifyListeners();
  }

  Color _lightprimarySwatch = Colors.purple;
  Color get lightprimarySwatch => _lightprimarySwatch;
  set lightprimarySwatch(Color value) {
    _lightprimarySwatch = value;
    notifyListeners();
  }

  Color _darkprimarySwatch = Colors.red;
  Color get darkprimarySwatch => _darkprimarySwatch;
  set darkprimarySwatch(Color value) {
    _darkprimarySwatch = value;
    notifyListeners();
  }
}

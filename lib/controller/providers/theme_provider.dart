import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

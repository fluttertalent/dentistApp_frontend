// globals.dart

import 'package:flutter/foundation.dart';

class GlobalData extends ChangeNotifier {
  int  _score = 0;

  int get score => _score;

  void plusScore() {
    _score++;
    notifyListeners(); // Notify all listeners about the updated data
  }

  void minusScore() {
    _score--;
    notifyListeners(); // Notify all listeners about the updated data
  }
}
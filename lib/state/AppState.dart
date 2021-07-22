import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class AppState with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

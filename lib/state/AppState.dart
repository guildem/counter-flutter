import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../tools/Storage.dart';

class AppState with ChangeNotifier {
  final Storage storage = Storage();

  AppState() {
    _load();  
  }

  Future<void> _load() async {
    final state = await storage.load('app_state');
    
    _counter = state['counter'] ?? 0;

    final int primaryColorValue = state['primaryColor'] ?? -1;
    if (primaryColorValue >= 0)
      _primaryColor = Color(primaryColorValue);
    
    notifyListeners();
  }

  Future<void> _save() async {
    await storage.save('app_state', {
      'counter': _counter,
      'primaryColor': _primaryColor.value,
    });
  }

  int _counter = 0;
  Color _primaryColor = Colors.blue;

  int get counter => _counter;
  Color get primaryColor => _primaryColor;

  void incrementCounter() async {
    _counter = min(_counter + 1, 10);
    await _save();
    notifyListeners();
  }

  void decrementCounter() async {
    _counter = max(_counter - 1, 0);
    await _save();
    notifyListeners();
  }

  void updatePrimaryColor(Color value) async {
    _primaryColor = value;
    await _save();
    notifyListeners();
  }
}

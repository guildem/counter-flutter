import 'package:flutter/foundation.dart';
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
    notifyListeners();
  }

  Future<void> _save() async {
    await storage.save('app_state', {
      'counter': _counter,
    });
  }

  int _counter = 0;

  int get counter => _counter;

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
}

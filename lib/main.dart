import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/HomeScreen.dart';
import './state/AppState.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: state.primaryColor,
        accentColor: state.primaryColor,
      ),
      home: HomeScreen(title: 'My personal counter'),
    );
  }
}

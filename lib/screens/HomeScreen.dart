import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/AppState.dart';

final COLORS = [
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
];

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the counter value:',
            ),
            Text(
              '${state.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: COLORS.map((color) => ColorButton(color: color)).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
          FloatingActionButton(
            onPressed: state.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: state.decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({ Key? key, required this.color }): super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final state = context.read<AppState>();

    return Padding(
      padding: EdgeInsets.all(5),
      child: SizedBox(
        width: 24,
        height: 24,
        child: InkWell(
          onTap: () => state.updatePrimaryColor(color),
          child: Container(
            color: color,
          ),
        ),
      ),
    );
  }
}

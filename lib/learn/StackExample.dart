import 'package:flutter/material.dart';

void init() => runApp(CounterApp());

class CounterApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterAppState();
  }
}

class _CounterAppState extends State<CounterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.airplay,
              color: Colors.red,
              size: 200,
            ),
            Positioned(
              top : 60,
              left : 45,
              child: Text(
                'TV',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
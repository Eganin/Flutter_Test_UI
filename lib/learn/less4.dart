import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CounterApp());

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
        body: Container(
          decoration: BoxDecoration(
            color: Colors.indigo[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.adjust,
                size: 50,
                color: Colors.red,
              ),
              Icon(
                Icons.adjust,
                size: 200,
                color: Colors.green,
              ),
              Icon(
                Icons.adjust,
                size: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            // border - границы
            border: Border.all(),
          ),
          width: 200 ,
          height: 100,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(32),
          alignment: Alignment.center,
          child: Text(
            'Flutter',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
   */
}
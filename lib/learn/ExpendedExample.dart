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
        body: Row(
          children: [
            // Expended распределяет пространство между виджетами
            Expanded(
              flex: 2,
              child: Image.network(
                  'https://citatnica.ru/wp-content/uploads/2019/04/art-anime-devochka-3823.jpg'),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.red,
                child: Text('1'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.green,
                child: Text('2'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(30),
                color: Colors.blue,
                child: Text('3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
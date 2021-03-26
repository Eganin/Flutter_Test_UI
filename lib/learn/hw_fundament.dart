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
  int _counter;

  @override
  void initState() {
    _counter = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Counter'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tap "-" to decrement'),
              Container(
                color: Colors.white70,
                margin: const EdgeInsets.only(right:140,left :140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.exposure_neg_1),
                        onPressed: () {
                          setState(() {
                            _counter--;
                          });
                        }),
                    Text('$_counter'),
                    IconButton(
                        icon: Icon(Icons.plus_one_sharp),
                        onPressed: () {
                          setState(() {
                            _counter++;
                          });
                        })
                  ],
                ),
              ),
              Text('Tap "+" to increment'),
            ],
          ),
        ),
      ),
    );
  }
}
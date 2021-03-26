import 'dart:async';
import 'package:flutter/material.dart';

void init() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  bool _loading;
  double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('First App'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //изменение состояния для новой отрисовки
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: Icon(Icons.cloud_download),
        ),
        body: getBody(loading: _loading, progressValue: _progressValue),
      ),
    );
  }

  void _updateProgress() {
    const oneSecond = const Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          _progressValue = 0.0;
          timer.cancel();
          //return;
        }
      });
    });
  }
}

Widget getBody({bool loading, double progressValue}) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(16),
      child: loading
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(value: progressValue),
          Text(
            '${(progressValue * 100).round()}%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      )
          : Text(
        'Press button to download',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/navigation/secondScreen.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Some text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                text,
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextButton(
              onPressed: () => _returnDataFromSecondScreen(context),
              child: Text('Got to second screen'),
            ),
          ],
        ),
      ),
    );
  }

  void _returnDataFromSecondScreen(BuildContext context) async {
    Route route = MaterialPageRoute(builder: (context) => SecondScreen());
    final result = await Navigator.push(context, route);
    setState(() {
      text = result;
    });
  }
}

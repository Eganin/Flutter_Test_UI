import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String textToSendBack = textFieldController.text;
              Navigator.pop(context , textToSendBack);
            },
            child: Text('Send text back', style: TextStyle(fontSize: 24),),
          ),
        ],
      ),
    );
  }
}

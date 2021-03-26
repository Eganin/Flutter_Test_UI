import 'package:flutter/material.dart';

void less() {
  runApp(
    MaterialApp(// Cupertino
      home: Scaffold(
        appBar: AppBar(
          title : Text('First App'),
          centerTitle: true,
        ),
        body: getBody(),
        backgroundColor: Colors.indigo,
      ),
    ),
  );
}

Widget getBody(){
  return Center(
    child: Text(
      'Welcome to the club baddy',
      // чтение текста слева на право
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white.withOpacity(0.6),
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
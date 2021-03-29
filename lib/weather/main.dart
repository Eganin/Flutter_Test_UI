import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/navigation/firstScreen.dart';
import 'package:flutter_test_app/learn/ux/registerFormPage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.blue,
      ),
      home: RegisterFormPage(),
    ),
  );
}



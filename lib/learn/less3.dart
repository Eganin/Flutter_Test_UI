import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // установка шрифта для всего экрана
      theme: ThemeData(
        fontFamily: 'IndieFlower',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('assets'),
        ),
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                // download image from assets
                image: AssetImage('assets/images/bg.jpg'),
              ),
              Image.asset('assets/icons/icon.png'),
              Positioned(
                top: 16,
                left: 115,
                child: Text(
                  'My custom font',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
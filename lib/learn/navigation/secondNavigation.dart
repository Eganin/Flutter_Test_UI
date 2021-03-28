import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void init() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Navigation'),
          centerTitle: true,
        ),
        body: _HomePage(),
      ),
      //// init page
      //initialRoute: '/page2',
      // для навигации по имени
      routes: {
        '/page2': (context) => Page2(),
      },
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // open new page with navigation in app
          Navigator.pushNamed(context, '/page2');
        },
        child: Text('Move to page 2'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // go to back page
            Navigator.pop(context);
          },
          child: Text('Go back'),
        ),
      ),
    );
  }
}
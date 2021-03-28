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
    );
  }
}

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // open new page in app
          Route route = MaterialPageRoute(builder: (context)=> Page2());
          Navigator.push(context, route);
        },
        child: Text('Move to page 2'),
      ),
    );
  }
}

class Page2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            // go to back page
            Navigator.pop(context);
          },
          child: Text('Go back'),
        ),
      ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void init() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: _HomePage(),
      ),
      routes: {
        '/first': (context) => _HomePage(),
        '/second': (context) => SecondHome(),
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
          User user = User(name: 'Egor', age: 17);
          // push extra data
          Navigator.pushNamed(context, '/second',arguments:user);
        },
        child: Text('Second home'),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  User user;

  SecondHome({this.user});

  @override
  Widget build(BuildContext context) {
    // get extra data
    RouteSettings settings = ModalRoute.of(context).settings;
    user = settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name}'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back'),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({this.name, this.age});
}
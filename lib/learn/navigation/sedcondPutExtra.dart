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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => _HomePage());
            break;
          case '/second':
            User user = settings.arguments;
            return MaterialPageRoute(
                builder: (context) => SecondHome(
                      user: user,
                    ));
            break;

          default:
            break;
        }
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
          Navigator.pushNamed(context, '/second', arguments: user);
        },
        child: Text('Second home'),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  final User user;

  SecondHome({this.user});

  @override
  Widget build(BuildContext context) {
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

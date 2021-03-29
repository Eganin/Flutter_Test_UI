import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void init() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  double _size = 50;
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State',
      home: Scaffold(
        appBar: AppBar(
          title: Text('State Vanilla'),
          centerTitle: true,
        ),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Star(
              rating: _rating,
              size: _size,
            ),
            Star(
              rating: _rating,
              size: _size,
            ),
            Star(
              rating: _rating,
              size: _size,
            ),
          ]),
        ),
      ),
    );
  }
}

class Star extends StatefulWidget {
  int rating;
  double size;

  Star({this.rating, this.size});

  @override
  State<StatefulWidget> createState() {
    return _Star(rating: rating, size: size);
  }
}

class _Star extends State<Star> {
  int rating;
  double size;

  _Star({this.rating, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: (rating >= 3
            ? Icon(
                Icons.star,
                size: size,
              )
            : Icon(
                Icons.star_border,
                size: size,
              )),
        color: Colors.indigo[500],
        iconSize: size,
        onPressed: () {
          setState(() {
            rating = 3;
          });
        },
      ),
    );
  }
}

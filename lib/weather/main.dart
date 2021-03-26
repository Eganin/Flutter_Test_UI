import 'package:flutter/material.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _createAppBar(),
        body: _buildBody(),
      ),
    );
  }
}

Widget _createAppBar() {
  return AppBar(
    title: Text(
      'Weather',
      style: TextStyle(color: Colors.black87),
    ),
    centerTitle: true,
    backgroundColor: Colors.white,
    // leading -  элементы в левой части AppBar
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
    // actions - иконки с права AppBar
    actions: [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {},
      )
    ],
    iconTheme: IconThemeData(
      color: Colors.black54,
    ),
    brightness: Brightness.light,
  );
}

Widget _buildBody() {
  // ScrollView
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage()
      ],
    ),
  );
}

Widget _headerImage(){

}

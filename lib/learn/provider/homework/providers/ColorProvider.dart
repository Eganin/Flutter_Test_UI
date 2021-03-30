import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  List<MaterialColor> _colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.indigo,
    Colors.orange,
    Colors.pink,
    Colors.blue
  ];
  Random _random = new Random();
  bool isSwitched = false;
  MaterialColor _colorAppBar = Colors.blue;
  MaterialColor _colorBox = Colors.green;

  MaterialColor get currentColorAppBar => _colorAppBar;

  MaterialColor get currentColorBox => _colorBox;

  void switchColor() {
    _colorAppBar = _colors[_random.nextInt(3)];
    _colorBox = _colors[_random.nextInt(3)];
    isSwitched = !isSwitched;
    notifyListeners();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvents {
  event_red,
  event_green,
}

class ColorBloc {
  Color _color = Colors.red;

  // ignore: close_sinks
  final _inputEventController = StreamController<ColorEvents>();

  // sink входной поток куда добавляются данные
  StreamSink<ColorEvents> get inputEventSink => _inputEventController.sink;

  // ignore: close_sinks
  final _outputStateController = StreamController<Color>();

  // выходной поток с данными
  Stream<Color> get outputStateStream => _outputStateController.stream;

  ColorBloc() {
    // устанавливаем слушатель для входных данных
    _inputEventController.stream.listen((event) {
      _mapEventToState(event: event);
    });
  }

  void _mapEventToState({ColorEvents event}) {
    if (event == ColorEvents.event_red)
      _color = Colors.red;
    else if (event == ColorEvents.event_green)
      _color = Colors.green;
    else
      throw Exception('Wrong event');

    _outputStateController.sink.add(_color);
  }

  void dispose(){
    _inputEventController.close();
    _outputStateController.close();
  }
}

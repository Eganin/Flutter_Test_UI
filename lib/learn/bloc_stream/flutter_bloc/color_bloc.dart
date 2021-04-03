import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent {
  event_red,
  event_green,
}

// Bloc<событие , сотояние-выводимое значение>
class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.red;

  ColorBloc({Color initialState}) : super(initialState);

  // async* - означает работу с потоками
  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.event_red) ? Colors.red : Colors.green;
    // добавляем значения в выходной поток
    yield _color;
  }
}

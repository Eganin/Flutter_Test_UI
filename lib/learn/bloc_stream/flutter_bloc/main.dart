import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc.dart';

void init() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Stream',
      home: BlocProvider(
        create: (context) => ColorBloc(
          initialState: Colors.red,
        ),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc with flutter_bloc'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc , Color>(
          builder: (context , state)=>AnimatedContainer(
            height: 100,
            width: 100,
            color: state,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_red);
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ColorEvent.event_green);
            },
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

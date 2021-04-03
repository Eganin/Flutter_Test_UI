import 'package:flutter/material.dart';

import 'color_bloc.dart';

void init() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Stream',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          // выходной поток
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 100,
              width: 100,
              color: snapshot.data,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvents.event_red);
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => _bloc.inputEventSink.add(ColorEvents.event_green),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

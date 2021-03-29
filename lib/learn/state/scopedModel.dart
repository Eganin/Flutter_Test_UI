import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inherited Widget',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(
        title: "Inherited Demo",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Demo'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ScopedModel<MyModelState>(
            model: MyModelState(),
            child: AppRootWidget(),
          ),
        ],
      ),
    );
  }
}

class AppRootWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Text(
            'Root Widget',
            style: Theme
                .of(context)
                .textTheme
                .display1,
          ),
          Text(
            '0',
            style: Theme
                .of(context)
                .textTheme
                .display1,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Counter(),
              Counter(),
            ],
          ),
        ],
      ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyModelState>(
      builder: (context, child, model) =>
          Card(
            margin: EdgeInsets.all(4).copyWith(bottom: 32),
            color: Colors.yellowAccent,
            child: Column(
              children: [
                Text('Child Widget'),
                Text(
                  '${model.counterValue}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                ),
                ButtonBar(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      color: Colors.red,
                      onPressed: () {
                        model._decrementCounter();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.green,
                      onPressed: () {
                        model._incrementCounter();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
      rebuildOnChange: true,
    );
  }
}

class MyModelState extends Model {
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void _decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

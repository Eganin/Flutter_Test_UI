import 'package:flutter/material.dart';

void init() => runApp(MyApp());

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
  int _counter = 0;

  int get counterValue => _counter;

  void _incrementCounter() => setState(() => _counter++);

  void _decrementCounter() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Demo'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MyInheritedWidget(
            myState: this,
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
    final rootWidgetState = MyInheritedWidget.of(context).myState;
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          Text(
            'Root Widget',
            style: Theme.of(context).textTheme.display1,
          ),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.display1,
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
    final rootWidgetState = MyInheritedWidget.of(context).myState;
    return Card(
      margin: EdgeInsets.all(4).copyWith(bottom: 32),
      color: Colors.yellowAccent,
      child: Column(
        children: [
          Text('Child Widget'),
          Text(
            '${rootWidgetState.counterValue}',
            style: Theme.of(context).textTheme.display1,
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                color: Colors.red,
                onPressed: () {
                  rootWidgetState._decrementCounter();
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.green,
                onPressed: () {
                  rootWidgetState._incrementCounter();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final _MyHomePageState myState;

  MyInheritedWidget({Key key, Widget child, @required this.myState})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return this.myState.counterValue != oldWidget.myState.counterValue;
  }

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

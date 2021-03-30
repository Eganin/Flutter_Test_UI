import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/provider/homework/providers/ColorProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<ColorProvider>.value(
        value: ColorProvider(),
      ),
    ], child: Body());
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorProvider _state = Provider.of<ColorProvider>(context);
    return MaterialApp(
      title: 'Provider Homework',
      theme: ThemeData(
        primarySwatch: _state.currentColorAppBar,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Provider Homework'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: 100.0,
                height: 100.0,
                color: _state.currentColorBox,
              ),
              Switch(
                  value: _state.isSwitched,
                  onChanged: (value) {
                    _state.switchColor();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_app/learn/provider/example/providers/CountProvider.dart';

class MyCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // из provider будем получать данные и методы
    // для большей перестройки экрана
    CountProvider _state = Provider.of<CountProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ChangeNotifierProvider Example',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '${_state.counterValue}',
              style: Theme.of(context).textTheme.display1,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: () {
                    _state.decrementCount();
                  },
                ),
                // для меньшей перестройки экрана
                Consumer<CountProvider>(builder: (context, value, child) {
                  return IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.green,
                    onPressed: () {
                      value.incrementCount();
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/provider/example/providers/CountProvider.dart';
import 'package:flutter_test_app/learn/provider/example/providers/EventProvider.dart';
import 'package:flutter_test_app/learn/provider/example/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'MyCountPage.dart';
import 'MyEventPage.dart';
import 'MyUserPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CountProvider>.value(
            value: CountProvider(),
          ),
          FutureProvider(create: (_) async => UserProvider().loadUserData()),
          StreamProvider(
            create: (_) => EventProvider().intStream(),
            initialData: 0,
          ),
        ],
        //DefaultTabController - для реализации верхней навигации
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Provider Demo'),
              centerTitle: true,
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.add),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                MyCountPage(),
                MyUserPage(),
                MyEventPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


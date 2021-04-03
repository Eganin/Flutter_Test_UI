import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/network/offices.dart';

void init() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Networking',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<OfficesList> officesList;

  @override
  void initState() {
    officesList = getOfficesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking'),
        centerTitle: true,
      ),
      body: FutureBuilder<OfficesList>(
        future: officesList,
        builder: (context, snapshot) {
          // snapshot - состояние объекта future
          if (snapshot.hasData) {
            List<Office> offices = snapshot.data.offices;
            return ListView.builder(
                itemCount: offices.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(offices[index].name),
                      subtitle: Text(offices[index].address),
                      leading: Image.network(offices[index].image),
                      isThreeLine: true,
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('Error');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

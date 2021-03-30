import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/provider/example/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class MyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'FutureProvider Example',
            style: TextStyle(fontSize: 17),
          ),
        ),
        Consumer(
          builder: (context, List<User> users, _) {
            return Expanded(
                child: users == null
                    ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
                    : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      color: Colors.grey[(index * 200) % 400],
                      child: Center(
                        child: Text(
                            '${users[index].firstName} ${users[index].lastName} | ${users[index].website}'),
                      ),
                    );
                  },
                ));
          },
        ),
      ],
    );
  }
}
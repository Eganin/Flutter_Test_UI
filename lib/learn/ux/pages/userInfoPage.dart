import 'package:flutter/material.dart';
import 'package:flutter_test_app/learn/ux/model/user.dart';

class UserInfoPage extends StatelessWidget {
  User userInfo;

  UserInfoPage({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name : ${userInfo.name}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: userInfo.story.isNotEmpty
                  ? Text('Story : ${userInfo.story}')
                  : Text(''),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: userInfo.coutry.isNotEmpty
                  ? Text('Country : ${userInfo.coutry}')
                  : Text(''),
            ),
            ListTile(
              title: Text('Phone : ${userInfo.phone}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            userInfo.email.isNotEmpty
                ? ListTile(
                    title: Text('Email : ${userInfo.email}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                    leading: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  )
                : ListTile(),
          ],
        ),
      ),
    );
  }
}

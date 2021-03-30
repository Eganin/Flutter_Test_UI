import 'dart:convert';

import 'package:flutter/services.dart';

class UserProvider {
  final String _dataPath = 'assets/users.json';
  List<User> users;

  Future<String> loadAsset() async {
    return await rootBundle.loadString(_dataPath);
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(userJson: jsonUserData['users']).users;
    return users;
  }
}

class User {
  final String firstName, lastName, website;

  const User({this.firstName, this.lastName, this.website});

  User.fromJson({Map<String, dynamic> json})
      : this.firstName = json['first_name'],
        this.lastName = json['last_name'],
        this.website = json['website'];
}

class UserList {
  final List<User> users;

  UserList({this.users});

  UserList.fromJson({List<dynamic> userJson})
      : users = userJson.map((user) => User.fromJson(json: user)).toList();
}
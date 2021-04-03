import 'package:flutter_test_app/learn/bloc_network/models/user.dart';
import 'api/user_api_provider.dart';

class UsersRepository {
  UserProvider _userProvider = UserProvider();

  Future<List<User>> getAllUsers() => _userProvider.getUser();
}

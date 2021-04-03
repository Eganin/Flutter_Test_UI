import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/learn/bloc_network/cubit/user_cubit.dart';
import 'package:flutter_test_app/learn/bloc_network/services/user_repository.dart';
import 'package:flutter_test_app/learn/bloc_network/widgets/actions_buttons.dart';
import 'package:flutter_test_app/learn/bloc_network/widgets/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository: usersRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Users List'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}

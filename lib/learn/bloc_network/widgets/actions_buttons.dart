
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/learn/bloc_network/cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          onPressed: () {
            //userCubit.add(UserLoadEvent());
            userCubit.fetchUsers();
          },
          child: Text('Load'),
          color: Colors.green,
        ),
        SizedBox(
          width: 8,
        ),
        MaterialButton(
          onPressed: () {
            //userCubit.add(UserClearEvent());
            userCubit.clearUsers();
          },
          child: Text('Clear'),
          color: Colors.red,
        ),
      ],
    );
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/learn/bloc_network/bloc/user_state.dart';
import 'package:flutter_test_app/learn/bloc_network/models/user.dart';
import 'package:flutter_test_app/learn/bloc_network/services/user_repository.dart';

class UserCubit extends Cubit<UserState>{
  final UsersRepository usersRepository;

  UserCubit({this.usersRepository}) : super(UserEmptyState());

  Future<void> fetchUsers() async{
    try{
      emit(UserLoadingState());
      final List<User> _loadedUserLIsr = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: _loadedUserLIsr));
    }catch(_){
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async{
    emit(UserEmptyState());// установление сотояния
  }

}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/learn/bloc_network/bloc/user_events.dart';
import 'package:flutter_test_app/learn/bloc_network/bloc/user_state.dart';
import 'package:flutter_test_app/learn/bloc_network/models/user.dart';
import 'package:flutter_test_app/learn/bloc_network/services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc({this.usersRepository}) : super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // обработка событий из ui
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        // loading data
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (e) {
        yield UserErrorState();
      }
    }else if(event is UserClearEvent){
      yield UserEmptyState();
    }
  }
}

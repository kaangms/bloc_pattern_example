import 'package:bloc_pattern_example/features/user/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userService) : super(UserInitialState()) {
    Future.delayed(Duration(seconds: 10), () => initial());
  }
  final IUserService userService;
  Future<void> initial() async {
    users = await userService.fetchUsers();
    emit(UsersLoadedState());
  }

  List<UserModel> users = <UserModel>[];
}

abstract class UserState {}

class UserInitialState extends UserState {}

class UsersLoadedState extends UserState {}

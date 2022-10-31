import 'package:bloc_pattern_example/features/user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userService) : super(UserInitialState()) {
    Future.delayed(Duration(seconds: 10), () => initial());
  }
  late TextEditingController searchEditingController;
  final IUserService userService;
  Future<void> initial() async {
    searchEditingController = TextEditingController();
    users = await userService.fetchUsers();
    _preSearchUsers = users;
    emit(UsersLoadedState());
  }

  List<UserModel> users = <UserModel>[];
  List<UserModel> _preSearchUsers = <UserModel>[];
  bool statusSearch = false;
  // bool isHasSearchAction = true;
  void changeStatusSearch() {
    statusSearch = !statusSearch;
    emit(AppBarSearchActiveState());
  }

  void searchUserList() {
    if (searchEditingController.text == '') {
      users = _preSearchUsers;
    } else {
      if (users.isNotEmpty) {
        users = users.where((e) => e.name == searchEditingController.text).toList();
        emit(SearchingState());
      }
    }
  }
}

abstract class UserState {}

class UserInitialState extends UserState {}

class UsersLoadedState extends UserState {}

class AppBarSearchActiveState extends UserState {}

class SearchingState extends UserState {}

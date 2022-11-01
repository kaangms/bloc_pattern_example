import 'package:bloc_pattern_example/core/extensions/string_extensions.dart';
import 'package:bloc_pattern_example/features/user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userService) : super(UserInitialState()) {
    // Future.delayed(Duration(seconds: 10), () => initial());
    initial();
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
    emit(AppBarSearchChangeState());
  }

  void searchUserList(String? v) {
    users = _preSearchUsers;
    if (users.isNotEmpty && v != null && v != '') {
      users = users
          .where((e) => e.name != null ? e.name!.unknowCharacterToEnglish.toLowerCase().contains(v.unknowCharacterToEnglish.toLowerCase()) : false)
          .toList();
    }
    emit(SearchingState());
  }

  void navigateToUserDetailView(BuildContext context, UserModel user) {
    emit(UserViewNavigateToUserDetailView(user));
  }
}

abstract class UserState {}

class UserInitialState extends UserState {}

class UsersLoadedState extends UserState {}

class AppBarSearchChangeState extends UserState {}

class SearchingState extends UserState {}

class UserViewNavigateToUserDetailView extends UserState {
  final UserModel selectedUser;

  UserViewNavigateToUserDetailView(this.selectedUser);
}

part of 'user_cubit.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UsersLoadedState extends UserState {}

class AppBarSearchChangeState extends UserState {}

class SearchingState extends UserState {}

class UserViewNavigateToUserDetailView extends UserState {
  final UserModel userModel;

  UserViewNavigateToUserDetailView(this.userModel);
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userService) : super(UserInitial());
  final IUserService userService;
}

abstract class UserState {}

class UserInitial extends UserState {}

import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
}

abstract class UserState {}

class UserInitial extends UserState {}

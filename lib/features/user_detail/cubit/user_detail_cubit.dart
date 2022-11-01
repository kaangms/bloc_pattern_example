import 'package:bloc_pattern_example/core/extensions/string_extensions.dart';
import 'package:bloc_pattern_example/features/user/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_detail_model.dart';
import '../service/user_detail_service.dart';
part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit(this.userDetailService) : super(UserDetialInitialState()) {
    initial();
  }

  final IUserDetailService userDetailService;
  Future<void> initial() async {
    users = await userDetailService.fetchUserDetail();
    emit(UserDetailLoadedState());
  }

  UserDetailModel users = UserDetailModel();
}

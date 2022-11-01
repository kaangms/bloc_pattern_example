import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_detail_model.dart';
import '../service/user_detail_service.dart';
part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  UserDetailCubit(this.userDetailService, this.userId) : super(UserDetialInitialState()) {
    initial();
  }
  String? userId;
  final IUserDetailService userDetailService;
  Future<void> initial() async {
    if (userId != null) {
      userDetal = await userDetailService.fetchUserDetail(userId!);
      emit(UserDetailLoadedState());
    } else {
      emit(UserDetailNotFoundState());
    }
  }

  UserDetailModel userDetal = UserDetailModel();
}

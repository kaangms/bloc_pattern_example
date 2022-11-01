// import 'package:bloc_pattern_example/core/init/network/app_network_manager.dart';
// import 'package:bloc_pattern_example/features/user/cubit/user_cubit.dart';
// import 'package:bloc_pattern_example/features/user/model/user_model.dart';
// import 'package:bloc_pattern_example/features/user/service/user_service.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// class MockUserCubit extends MockCubit<UserState> implements UserCubit {}

// void main() {
//   group('whenListen', () {
//     final cubit = UserCubit(UserService(AppNetworkManager.instance.networkManager));
//     expect(cubit.state, UserInitialState());
//     // blocTest<UserCubit, UserState>(
//     //   'emits [] when nothing is called',
//     //   build: () => UserCubit(UserService(AppNetworkManager.instance.networkManager)),
//     //   expect: () => <UserState>[UserInitialState()],
//     // );
//   });
// }

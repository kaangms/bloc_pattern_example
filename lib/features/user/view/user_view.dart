import 'package:bloc_pattern_example/features/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/network/app_network_manager.dart';
import '../../../core/init/network/network_manager.dart';
import '../service/user_service.dart';

class UserView extends StatefulWidget {
  UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserService(AppNetworkManager.instance.networkManager)),
      child: Container(),
    );
  }
}

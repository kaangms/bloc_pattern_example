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
      child: Scaffold(
        appBar: AppBar(title: Text('Kullanıcı Listesi')),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = context.read<UserCubit>();
        if (state.runtimeType == UserInitialState) {
          return const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else {
          return _bodyListView(cubit);
        }
      },
    );
  }

  ListView _bodyListView(UserCubit cubit) {
    return ListView.builder(
      itemCount: cubit.users.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [Text(cubit.users[index].name ?? '')],
        );
      },
    );
  }
}

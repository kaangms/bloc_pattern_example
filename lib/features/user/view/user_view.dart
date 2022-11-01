import 'package:auto_route/auto_route.dart';
import 'package:bloc_pattern_example/core/extensions/context_extensions.dart';
import 'package:bloc_pattern_example/features/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/network/app_network_manager.dart';
import '../../../product/routing/navigator/bloc/navigation_bloc.dart';
import '../../../product/widgets/bloc_example_appbar/bloc_example_appbar.dart';
import '../../../product/widgets/cards/user_card.dart';
import '../../../product/widgets/loading_widget.dart';
import '../model/user_model.dart';
import '../service/user_service.dart';
part './subview/navigation_extensions.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(UserService(AppNetworkManager.instance.networkManager)),
      child: _scaffoldBuild(context),
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(listener: (context, state) {
      if (state is UserViewNavigateToUserDetailView) {
        state.navigateToUserDetailView(context, state.userModel);
      }
    }, builder: (context, state) {
      var cubit = context.read<UserCubit>();
      return Scaffold(
        appBar: BlocExampleAppBar(
          context,
          titleText: 'Kullanıcı Listesi',
          isHasSearchBar: true,
          searchStatus: cubit.searchStatus,
          controller: cubit.searchEditingController,
          changesearchStatus: cubit.changeStatusSearch,
          searchList: cubit.searchUserList,
        ),
        body: _body(cubit, state),
      );
    });
  }

  Widget _body(UserCubit cubit, UserState state) {
    if (state is UserInitialState) {
      return const LoadingWidget();
    } else {
      return _bodyListView(cubit);
    }
  }

  Widget _bodyListView(UserCubit cubit) {
    return cubit.users.isEmpty
        ? const Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Kullanıcı bulunamadı'),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: ListView.builder(
              itemCount: cubit.users.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () => cubit.navigateToUserDetailView(context, cubit.users[index]),
                    child: UserCard(name: cubit.users[index].name, avatar: cubit.users[index].avatar));
              },
            ),
          );
  }
}

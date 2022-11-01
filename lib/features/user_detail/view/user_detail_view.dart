import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/init/network/app_network_manager.dart';
import '../../../product/widgets/bloc_example_appbar/bloc_example_appbar.dart';
import '../../../product/widgets/loading_widget.dart';
import '../../user/model/user_model.dart';
import '../cubit/user_detail_cubit.dart';
import '../service/user_detail_service.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  final UserModel userModel;
  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDetailCubit(UserDetailService(AppNetworkManager.instance.networkManager)),
      child: _scaffoldBuild(context),
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return BlocConsumer<UserDetailCubit, UserDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<UserDetailCubit>();
          return Scaffold(
            appBar: BlocExampleAppBar(
              context,
              titleText: 'Kullanıcı Detay',
            ),
            body: _body(cubit, state),
          );
        });
  }

  Widget _body(UserDetailCubit cubit, UserDetailState state) {
    if (state is UserDetialInitialState) {
      return const LoadingWidget();
    } else {
      return Text('açıldı');
      //_bodyListView(cubit);
    }
  }
}

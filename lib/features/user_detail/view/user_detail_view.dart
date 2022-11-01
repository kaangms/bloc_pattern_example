import 'package:bloc_pattern_example/product/widgets/cards/user_card.dart';
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
      create: (context) => UserDetailCubit(
        UserDetailService(AppNetworkManager.instance.networkManager),
        widget.userModel.id,
      ),
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
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
        child: Column(
          children: [
            UserCard(
              avatar: widget.userModel.avatar,
              name: widget.userModel.name,
              elevation: 0,
            ),
            const SizedBox(height: 20),
            buildUserInfo(title: 'Tel No', value: cubit.userDetal.phoneNumber),
            buildUserInfo(title: 'Eposta', value: cubit.userDetal.email),
            buildUserInfo(title: 'İlçe', value: cubit.userDetal.county),
            buildUserInfo(title: 'İl', value: cubit.userDetal.city),
            buildUserInfo(title: 'Ülke', value: cubit.userDetal.country),
          ],
        ),
      );
    }
  }

  Widget buildUserInfo({required String title, required String? value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 18),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  ':  ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(value ?? ''),
          ),
        ],
      ),
    );
  }
}

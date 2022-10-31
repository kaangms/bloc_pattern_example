import 'package:bloc_pattern_example/core/extensions/context_extensions.dart';
import 'package:bloc_pattern_example/features/user/cubit/user_cubit.dart';
import 'package:bloc_pattern_example/product/constants/aplication_constants.dart';
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
      child: _scaffoldBuild(context),
    );
  }

  Widget _scaffoldBuild(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<UserCubit>();
          return Scaffold(
            appBar: AppBar(
              title: cubit.statusSearch ? const SizedBox.shrink() : const Text('Kullanıcı Listesi'),
              actions: [
                if (cubit.statusSearch)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: SizedBox(
                        width: context.width - 50,
                        child: TextFormField(
                          controller: cubit.searchEditingController,
                          cursorColor: Colors.grey,
                          style: const TextStyle(color: Colors.black, fontSize: 16.0),
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.white),
                            contentPadding: const EdgeInsets.only(left: 22),
                            filled: true,
                            hoverColor: Colors.white,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff1f1f1), width: 1.0),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xfff1f1f1), width: 1.0),
                            ),
                            hintText: 'Kullanıcı listesinde ara....',
                            suffixIcon: const Icon(
                              Icons.search,
                              size: 22,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (v) => cubit.searchUserList(),
                        )),
                  ),
                // if (!cubit.statusSearch && isHasSearchAction)
                if (!cubit.statusSearch)
                  InkWell(
                    onTap: cubit.changeStatusSearch,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Icon(
                        Icons.search,
                        size: 32,
                      ),
                    ),
                  ),
              ],
            ),
            body: _body(cubit, state),
          );
        });
  }

  Widget _body(UserCubit cubit, UserState state) {
    if (state.runtimeType == UserInitialState) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 28.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      );
    } else {
      return _bodyListView(cubit);
    }
  }

  Widget _bodyListView(UserCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView.builder(
        itemCount: cubit.users.length,
        itemBuilder: (BuildContext context, int index) {
          return UserCard(name: cubit.users[index].name, avatar: cubit.users[index].avatar);
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    this.avatar,
    this.name,
  }) : super(key: key);
  final String? avatar;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(avatar ?? ApplicationConstats.instance.dummyImage),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name ?? '',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../user/model/user_model.dart';

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
    return Container(
      child: Text(widget.userModel.name ?? ''),
    );
  }
}

import 'package:flutter/material.dart';

import '../../constants/aplication_constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    this.avatar,
    this.name,
    this.elevation,
  }) : super(key: key);
  final String? avatar;
  final String? name;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: elevation,
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

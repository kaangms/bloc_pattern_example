import 'package:flutter/material.dart';

class UserInfoBar extends StatelessWidget {
  const UserInfoBar({Key? key, required this.title, required this.value}) : super(key: key);
  final String title;
  final String? value;
  @override
  Widget build(BuildContext context) {
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

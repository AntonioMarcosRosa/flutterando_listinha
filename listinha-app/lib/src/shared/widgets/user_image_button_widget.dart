import 'package:flutter/material.dart';

class UserImageButtonWidget extends StatelessWidget {
  const UserImageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        child: const Text('A'),
      ),
    );
  }
}

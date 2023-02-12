import 'package:flutter/material.dart';

class UserImageButtonWidget extends StatelessWidget {
  const UserImageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: const Text('A'),
      ),
    );
  }
}

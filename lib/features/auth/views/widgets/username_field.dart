import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      id: 'username',
      label: const Text('Username'),
      placeholder: const Text('Enter your username'),
      leading: const Icon(LucideIcons.user, size: 16),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (v) {
        if (v.trim().isEmpty) return 'Username is required.';
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'password_field.g.dart';

@riverpod
class PasswordObscure extends _$PasswordObscure {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

class PasswordField extends ConsumerWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscure = ref.watch(passwordObscureProvider);

    return ShadInputFormField(
      id: 'password',
      label: const Text('Password'),
      placeholder: const Text('Enter your password'),
      obscureText: obscure,
      leading: const Icon(LucideIcons.lock, size: 16),
      textInputAction: TextInputAction.done,
      trailing: SizedBox.square(
        dimension: 24,
        child: OverflowBox(
          maxWidth: 28,
          maxHeight: 28,
          child: ShadIconButton(
            iconSize: 16,
            padding: const EdgeInsets.all(2),
            icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye),
            onPressed: () =>
                ref.read(passwordObscureProvider.notifier).toggle(),
          ),
        ),
      ),
      validator: (v) {
        if (v.isEmpty) return 'Password is required.';
        return null;
      },
    );
  }
}

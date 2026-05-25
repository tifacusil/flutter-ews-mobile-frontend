import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../viewmodels/login_view_model.dart';
import 'login_button.dart';
import 'password_field.dart';
import 'username_field.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<ShadFormState>();

  void _submit() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;
    final values = _formKey.currentState!.value;
    ref
        .read(loginViewModelProvider.notifier)
        .login(values['username'] as String, values['password'] as String);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final loginState = ref.watch(loginViewModelProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: ShadCard(
        title: Text('Sign in', style: theme.textTheme.h4),
        description: const Text('Access your monitoring dashboard.'),
        child: ShadForm(
          key: _formKey,
          autovalidateMode: ShadAutovalidateMode.alwaysAfterFirstValidation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              const UsernameField(),
              const SizedBox(height: 16),
              const PasswordField(),
              if (loginState.error != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      LucideIcons.circleAlert,
                      size: 14,
                      color: theme.colorScheme.destructive,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        loginState.error!,
                        style: theme.textTheme.small.copyWith(
                          color: theme.colorScheme.destructive,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 24),
              LoginButton(isLoading: loginState.isLoading, onPressed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}

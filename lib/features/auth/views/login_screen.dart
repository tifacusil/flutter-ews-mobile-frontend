import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: connect to LoginViewModel
    // TODO: username + password fields, login button, error display
    return Scaffold(
      appBar: AppBar(title: const Text('EWS Login')),
      body: const Center(
        child: Text('Login screen — TODO'),
      ),
    );
  }
}

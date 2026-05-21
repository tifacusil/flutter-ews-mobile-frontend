import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/router_utils.dart';
import '../viewmodels/login_view_model.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginViewModelProvider, (_, next) {
      if (next.isSuccess) context.goTo(AppRoutes.projects);
    });

    final width = MediaQuery.sizeOf(context).width;
    // Phones: 24px edge padding. Tablets / landscape: clamp to 10% of width
    // so the card never touches the edges but also doesn't float too far in.
    final hPadding = width < 600 ? 24.0 : (width * 0.1).clamp(24.0, 80.0);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 48),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginHeader(),
                SizedBox(height: 40),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

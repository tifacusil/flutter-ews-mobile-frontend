import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/providers/providers.dart';
import 'core/services/notification_service.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();

  await NotificationService.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
  ));

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
      ],
      child: const EwsApp(),
    ),
  );
}

class EwsApp extends ConsumerStatefulWidget {
  const EwsApp({super.key});

  @override
  ConsumerState<EwsApp> createState() => _EwsAppState();
}

class _EwsAppState extends ConsumerState<EwsApp> {
  StreamSubscription<RemoteMessage>? _tapSubscription;

  @override
  void initState() {
    super.initState();
    _tapSubscription =
        NotificationService.notificationTaps.listen(_onNotificationTap);
  }

  @override
  void dispose() {
    _tapSubscription?.cancel();
    super.dispose();
  }

  /// Called whenever the user taps a push notification (background or
  /// terminated). Reads [message.data] and navigates to the right screen.
  ///
  /// Expected payload keys sent by the backend:
  ///   type       – "alert" | "project"
  ///   project_id – numeric project ID (string)
  void _onNotificationTap(RemoteMessage message) {
    final router = ref.read(routerProvider);
    _navigateFromMessage(message.data, router);
  }

  void _navigateFromMessage(Map<String, dynamic> data, GoRouter router) {
    final type = data['type'] as String?;
    final projectId =
        data['project_id'] as String? ?? data['projectId'] as String?;

    switch (type) {
      case 'alert':
        if (projectId != null && projectId.isNotEmpty) {
          router.go('/alerts?projectId=$projectId');
        } else {
          router.go('/alerts/recent');
        }
      case 'project':
        if (projectId != null && projectId.isNotEmpty) {
          router.go('/projects/$projectId');
        } else {
          router.go('/projects');
        }
      default:
        // Unknown type — fall back to recent alerts.
        router.go('/alerts/recent');
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return ShadApp.router(
      title: 'EWS Landslide Monitor',
      theme: AppTheme.shad,
      darkTheme: AppTheme.shadDark,
      routerConfig: router,
      builder: (context, child) => SafeArea(
        top: false,
        child: child!,
      ),
    );
  }
}

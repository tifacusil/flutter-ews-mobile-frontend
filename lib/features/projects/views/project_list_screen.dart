import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../core/models/alert_level.dart';
import '../../../core/models/project.dart';
import '../../../core/providers/providers.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/router_utils.dart';
import '../viewmodels/project_list_view_model.dart';

class ProjectListScreen extends ConsumerWidget {
  const ProjectListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final projectsAsync = ref.watch(projectListViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Projects', style: theme.textTheme.h4),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.refreshCw, size: 18),
            onPressed: () => ref.read(projectListViewModelProvider.notifier).reload(),
          ),
          IconButton(
            icon: const Icon(LucideIcons.logOut, size: 18),
            tooltip: 'Logout',
            onPressed: () => _confirmLogout(context, ref),
          ),
        ],
      ),
      body: projectsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.circleAlert, color: theme.colorScheme.destructive),
              const SizedBox(height: 8),
              Text(e.toString(), style: theme.textTheme.small),
            ],
          ),
        ),
        data: (projects) => projects.isEmpty
            ? const _EmptyState()
            : _ProjectList(projects: projects, count: projects.length),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Logout helpers
// ---------------------------------------------------------------------------

Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Log out?'),
      content: const Text('You will be returned to the login screen.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Log out'),
        ),
      ],
    ),
  );

  if (confirmed != true) return;

  final svc = ref.read(userManagementServiceProvider);
  await svc.clearSession();

  NotificationService.logout();

  // Notify the router — redirect will send to /login.
  ref.read(authStateNotifierProvider).notify();
}

class _ProjectList extends StatelessWidget {
  const _ProjectList({required this.projects, required this.count});

  final List<Project> projects;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: projects.length,
            separatorBuilder: (_, i) => const SizedBox(height: 8),
            itemBuilder: (context, i) => _ProjectTile(project: projects[i]),
          ),
        ),
        _SummaryFooter(count: count),
      ],
    );
  }
}

class _ProjectTile extends StatelessWidget {
  const _ProjectTile({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final level = project.activeAlertLevel;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => context.pushTo(AppRoutes.projectDetail(project.id)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              _AlertDot(level: level),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.muted,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        project.typeLabel,
                        style: theme.textTheme.small.copyWith(
                          color: theme.colorScheme.mutedForeground,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(project.displayName, style: theme.textTheme.p),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                LucideIcons.chevronRight,
                size: 18,
                color: theme.colorScheme.mutedForeground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertDot extends StatelessWidget {
  const _AlertDot({this.level});

  final AlertLevel? level;

  @override
  Widget build(BuildContext context) {
    final color = level != null
        ? AppColors.forLevel(level!)
        : ShadTheme.of(context).colorScheme.border;

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.folderOpen,
              size: 48,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 16),
            Text(
              'No projects yet',
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 8),
            Text(
              'You have no project subscriptions. Contact your administrator to get access.',
              textAlign: TextAlign.center,
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryFooter extends StatelessWidget {
  const _SummaryFooter({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.colorScheme.border)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Icon(LucideIcons.shieldCheck, size: 16, color: theme.colorScheme.mutedForeground),
          const SizedBox(width: 8),
          Text(
            '$count ${count == 1 ? 'project' : 'projects'} · All sensors active',
            style: theme.textTheme.small.copyWith(color: theme.colorScheme.mutedForeground),
          ),
        ],
      ),
    );
  }
}

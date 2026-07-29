import 'package:flutter/material.dart';

import '../design_system/design_system.dart';
import '../routes/app_routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ExScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: ExSpacing.md,
            vertical: ExSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu, color: colorScheme.onSurface),
                      const SizedBox(width: ExSpacing.md),
                      Text(
                        'EduLearn',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  ExAvatar(initials: 'PN', radius: 16),
                ],
              ),
              const SizedBox(height: ExSpacing.xl),

              // Avatar with Edit Badge
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: colorScheme.error,
                      shape: BoxShape.circle,
                      border: Border.all(color: colorScheme.surface, width: 3),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 16,
                      color: colorScheme.onError,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ExSpacing.lg),

              // Name and Title
              Text(
                'Pranshu Namdeo',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                  fontFamily:
                      'serif', // matching the sample image vibe if possible
                ),
              ),
              const SizedBox(height: ExSpacing.sm),
              Text(
                'Senior Product Designer & Lifelong Learner',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: ExSpacing.lg),

              // Edit Profile Button
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.error,
                  foregroundColor: colorScheme.onError,
                  padding: const EdgeInsets.symmetric(
                    horizontal: ExSpacing.xl,
                    vertical: ExSpacing.md,
                  ),
                ),
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: ExSpacing.xl),

              // Stat Row
              Row(
                children: [
                  const Expanded(
                    child: ExStatCard(value: '12', label: 'COURSES'),
                  ),
                  const SizedBox(width: ExSpacing.md),
                  const Expanded(
                    child: ExStatCard(value: '5', label: 'CERTS'),
                  ),
                  const SizedBox(width: ExSpacing.md),
                  const Expanded(
                    child: ExStatCard(value: '28', label: 'AWARDS'),
                  ),
                ],
              ),
              const SizedBox(height: ExSpacing.xl),

              // Action List
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(ExRadii.lg),
                ),
                child: Column(
                  children: [
                    ExProfileListTile(
                      title: 'Achievements',
                      leadingIcon: Icons.emoji_events_outlined,
                      onTap: () {},
                    ),
                    Divider(
                      height: 1,
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    ExProfileListTile(
                      title: 'Certificates',
                      leadingIcon: Icons.workspace_premium_outlined,
                      onTap: () {},
                    ),
                    Divider(
                      height: 1,
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    ExProfileListTile(
                      title: 'Settings',
                      leadingIcon: Icons.settings_outlined,
                      onTap: () {},
                    ),
                    Divider(
                      height: 1,
                      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                    ExProfileListTile(
                      title: 'Support & Feedback',
                      leadingIcon: Icons.help_outline,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ExSpacing.xl),

              // Log Out Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  },
                  icon: Icon(Icons.logout, color: colorScheme.error),
                  label: Text(
                    'Log Out',
                    style: TextStyle(color: colorScheme.error),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: colorScheme.error.withValues(alpha: 0.5),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: ExSpacing.md),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ExRadii.lg),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: ExSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}

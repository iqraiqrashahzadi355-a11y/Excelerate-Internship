import 'package:flutter/material.dart';

import '../design_system/design_system.dart';
import '../models/program.dart';
import '../routes/app_routes.dart';

class ProgramDetailsScreen extends StatefulWidget {
  const ProgramDetailsScreen({super.key});

  @override
  State<ProgramDetailsScreen> createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final program = ModalRoute.of(context)?.settings.arguments as Program?;

    return ExScaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Program Details',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(ExSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            ClipRRect(
              borderRadius: ExRadii.borderRadiusLg,
              child: program?.heroImageUrl.isNotEmpty == true
                  ? (program!.heroImageUrl.startsWith('http')
                        ? Image.network(
                            program.heroImageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 200,
                                width: double.infinity,
                                color: colorScheme.surface,
                              );
                            },
                            errorBuilder: (_, __, ___) => Container(
                              height: 200,
                              width: double.infinity,
                              color: colorScheme.surface,
                            ),
                          )
                        : Image.asset(
                            program.heroImageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 200,
                              width: double.infinity,
                              color: colorScheme.surface,
                            ),
                          ))
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: colorScheme.surface,
                    ),
            ),
            const SizedBox(height: ExSpacing.md),

            // Trending Tag
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: ExSpacing.sm,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer,
                borderRadius: ExRadii.borderRadiusFull,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_fire_department_outlined,
                    size: 16,
                    color: colorScheme.onTertiaryContainer,
                  ),
                  const SizedBox(width: ExSpacing.xs),
                  Text(
                    'TRENDING COURSE',
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ExSpacing.sm),

            // Title
            Text(
              program?.title ?? 'Advanced Sustainable\nArchitecture',
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                height: 1.2,
              ),
            ),
            const SizedBox(height: ExSpacing.md),

            // Description
            Text(
              program?.description ??
                  'Dive deep into the principles of eco-friendly building '
                      'design. This comprehensive program covers modern '
                      'materials, energy-efficient structures, and integrating '
                      'natural environments into urban planning. Perfect for '
                      'professionals looking to elevate their architectural '
                      'practice with sustainable methodologies.',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: ExSpacing.lg),

            // Details Card
            ExCard(
              child: Column(
                children: [
                  _buildDetailRow(
                    context,
                    icon: Icons.access_time,
                    title: 'Duration & Schedule',
                    subtitle: program != null
                        ? '${program.duration} (${program.schedule})'
                        : '12 Weeks (4 hours/week)',
                  ),
                  const Divider(height: ExSpacing.lg),
                  _buildDetailRow(
                    context,
                    icon: Icons.workspace_premium_outlined,
                    title: 'Certification',
                    subtitle: program?.certification.isNotEmpty == true
                        ? program!.certification
                        : 'Industry Recognized Certificate',
                  ),
                  const Divider(height: ExSpacing.lg),
                  _buildDetailRow(
                    context,
                    icon: Icons.people_outline,
                    title: 'Cohort Size',
                    subtitle: program != null
                        ? 'Limited to ${program.cohortSize} students'
                        : 'Limited to 25 students',
                  ),
                ],
              ),
            ),
            const SizedBox(height: ExSpacing.xl),

            // Instructor Section
            Text(
              'Instructor',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: ExSpacing.md),
            Row(
              children: [
                ExAvatar(
                  initials: program != null && program.instructorName.isNotEmpty
                      ? program.instructorName
                            .trim()
                            .split(RegExp(' +'))
                            .map((s) => s.isNotEmpty ? s[0] : '')
                            .take(2)
                            .join()
                            .toUpperCase()
                      : 'PN',
                  radius: 28,
                ),
                const SizedBox(width: ExSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program?.instructorName.isNotEmpty == true
                            ? program!.instructorName
                            : 'Pranshu Namdeo',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        program?.instructorTitle.isNotEmpty == true
                            ? program!.instructorTitle
                            : 'Lead Architect, EcoBuild Inc.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: ExSpacing.xxl),

            // Feedback Section
            Text(
              'Student Feedback',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: ExSpacing.md),
            ExCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const Icon(
                        Icons.star_half,
                        color: Colors.amber,
                        size: 20,
                      ),
                      const SizedBox(width: ExSpacing.sm),
                      Text(
                        '${program?.rating ?? 4.8}/5',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: ExSpacing.sm),
                  Text(
                    '"${program?.reviewText.isNotEmpty == true ? program!.reviewText : 'This program completely changed the way I look at building design. The concepts are very practical and easy to apply!'}"',
                    style: textTheme.bodyMedium?.copyWith(
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: ExSpacing.md),
                  Text(
                    '- ${program?.reviewAuthor.isNotEmpty == true ? program!.reviewAuthor : 'Alex Johnson, Architect'}',
                    style: textTheme.labelMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: ExSpacing.xxl),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ExSpacing.md,
              vertical: ExSpacing.md,
            ),
            child: Column(
              children: [
                ExPrimaryButton(
                  onPressed: () {},
                  child: const Text('Enroll Now'),
                ),
                const SizedBox(height: ExSpacing.sm),
                ExSecondaryButton(
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      AppRoutes.feedback,
                      arguments: program?.title,
                    );
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: const Text('Leave Feedback'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colorScheme.onSurfaceVariant, size: 24),
        const SizedBox(width: ExSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

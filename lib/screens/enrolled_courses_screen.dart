import 'package:flutter/material.dart';
import '../design_system/design_system.dart';

class EnrolledCoursesScreen extends StatelessWidget {
  const EnrolledCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ExScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: ExSpacing.md, vertical: ExSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom Header row matching the image (optional if you want to keep the AppBar)
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
                  ExAvatar(
                    initials: 'PN',
                    radius: 16,
                  ),
                ],
              ),
              const SizedBox(height: ExSpacing.xl),

              // Title & Subtitle
              Text(
                'Enrolled Courses',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: ExSpacing.sm),
              Text(
                'Pick up where you left off. Your journey through professional mastery continues here.',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: ExSpacing.xl),

              // Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ExFilterChip(
                      label: 'All Courses',
                      isSelected: true,
                      onSelected: (val) {},
                    ),
                    const SizedBox(width: ExSpacing.sm),
                    ExFilterChip(
                      label: 'In Progress',
                      isSelected: false,
                      onSelected: (val) {},
                    ),
                    const SizedBox(width: ExSpacing.sm),
                    ExFilterChip(
                      label: 'Completed',
                      isSelected: false,
                      onSelected: (val) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ExSpacing.xl),

              // Course Cards
              ExRichCourseCard(
                title: 'Advanced Visual Storytelling',
                imageUrl: 'https://images.unsplash.com/photo-1558655146-d09347e92766?q=80&w=600&auto=format&fit=crop',
                categoryTag: 'Design • Module 4 of 8',
                durationTag: '12h left',
                progress: 0.65,
                progressText: '65%',
                actionLabel: 'Resume Learning',
                onActionPressed: () {},
              ),
              const SizedBox(height: ExSpacing.lg),

              ExRichCourseCard(
                title: 'Creative Direction Strategy',
                imageUrl: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?q=80&w=600&auto=format&fit=crop',
                categoryTag: 'Strategy • Certificate Earned',
                durationTag: 'Completed',
                progress: 0.98,
                progressText: '98%',
                actionLabel: 'View Certificate',
                onActionPressed: () {},
              ),
              const SizedBox(height: ExSpacing.lg),

              ExRichCourseCard(
                title: 'Technical Workflow Optimization',
                imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=600&auto=format&fit=crop',
                categoryTag: 'Workflow • Module 1 of 12',
                durationTag: '7 Days Ago',
                progress: 0.12,
                progressText: '12%',
                actionLabel: 'Start Module 2',
                onActionPressed: () {},
              ),
              const SizedBox(height: ExSpacing.xl),

              // Top 5% Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(ExSpacing.xl),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(ExRadii.xl),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ExSpacing.md),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.trending_up, color: colorScheme.primary, size: 32),
                    ),
                    const SizedBox(height: ExSpacing.lg),
                    Text(
                      "You're in the top 5%\nof learners this week!",
                      textAlign: TextAlign.center,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: ExSpacing.md),
                    Text(
                      "You've completed 14 lessons in the last 7 days. Consistency is the key to mastering your craft. Keep up the momentum!",
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: ExSpacing.xl),
                    Text(
                      '14',
                      style: textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      'LESSONS',
                      style: textTheme.labelSmall?.copyWith(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../design_system/design_system.dart';
import '../models/program.dart';
import '../routes/app_routes.dart';

class ProgramListingScreen extends StatelessWidget {
  const ProgramListingScreen({super.key});

  static List<Program> programs = [
    Program(
      title: 'Flutter Mobile Development',
      startDate: 'August 5, 2026',
      description:
          'Learn Flutter and Dart by building practical mobile applications.',
      eligibility:
          'Open to students and beginners interested in mobile development.',
      schedule: 'Monday, Wednesday and Friday — 4:00 PM to 6:00 PM',
    ),
    Program(
      title: 'UI/UX Design Internship',
      startDate: 'August 12, 2026',
      description:
          'Learn user research, wireframing, prototyping and interface design.',
      eligibility:
          'Open to learners with an interest in design and user experience.',
      schedule: 'Tuesday and Thursday — 3:00 PM to 5:00 PM',
    ),
    Program(
      title: 'Data Analytics Essentials',
      startDate: 'August 19, 2026',
      description:
          'Develop skills in data cleaning, analysis and visualization.',
      eligibility:
          'Basic computer knowledge is required. Beginners are welcome.',
      schedule: 'Saturday — 9:00 AM to 1:00 PM',
    ),
    Program(
      title: 'Web Development Bootcamp',
      startDate: 'September 2, 2026',
      description:
          'Build responsive websites using HTML, CSS and JavaScript.',
      eligibility:
          'Open to students and aspiring frontend developers.',
      schedule: 'Monday to Thursday — 5:00 PM to 7:00 PM',
    ),
    Program(
      title: 'Cybersecurity Fundamentals',
      startDate: 'September 9, 2026',
      description:
          'Understand online security, common threats and basic protection.',
      eligibility:
          'Suitable for beginners with basic computer literacy.',
      schedule: 'Wednesday and Saturday — 10:00 AM to 12:00 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ExScaffold(
      appBar: AppBar(
        title: Text(
          'Programs',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(ExSpacing.md),
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: ExSpacing.md),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(ExSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      program.title,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: ExSpacing.sm),

                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: ExSpacing.sm),
                        Expanded(
                          child: Text(
                            'Starts: ${program.startDate}',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: ExSpacing.md),

                    Text(
                      program.description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: ExSpacing.md),

                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.details,
                            arguments: program,
                          );
                        },
                        child: const Text('View Details'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

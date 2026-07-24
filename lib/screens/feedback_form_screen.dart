import 'package:flutter/material.dart';

import '../design_system/design_system.dart';

/// ============================================================
/// FEEDBACK FORM SCREEN — Excelerate Connect
/// Owner: Iqra Shahzadi (Co-Lead)
///
/// Reached via: Navigator.pushNamed(context, '/feedback', arguments: program.title)
/// (wired by Pranshu from the Program Details screen's "Leave Feedback" button)
///
/// Uses the shared design system (ExScaffold, ExTextField,
/// ExPrimaryButton) — no hardcoded colors. The star rating row is a
/// small local widget since there's no shared star-rating component
/// yet in the design system.
/// ============================================================
class FeedbackFormScreen extends StatefulWidget {
  const FeedbackFormScreen({super.key});

  @override
  State<FeedbackFormScreen> createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _programNameController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  int _rating = 0;
  bool _ratingTouched = false; // becomes true once the user submits once
  bool _didPrefillProgramName = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Program title is passed as a route argument from Program Details:
    // Navigator.pushNamed(context, '/feedback', arguments: program.title)
    if (!_didPrefillProgramName) {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is String && args.isNotEmpty) {
        _programNameController.text = args;
      } else {
        _programNameController.text = 'Program';
      }
      _didPrefillProgramName = true;
    }
  }

  @override
  void dispose() {
    _programNameController.dispose();
    _nameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _validateComment(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please share a comment about the program';
    }
    if (value.trim().length < 20) {
      return 'Comment must be at least 20 characters';
    }
    return null;
  }

  Future<void> _handleSubmit() async {
    setState(() => _ratingTouched = true);

    final formValid = _formKey.currentState!.validate();
    final ratingValid = _rating > 0;

    if (!formValid || !ratingValid) return;

    FocusManager.instance.primaryFocus?.unfocus();

    // Simulated submission — replace with a real API call in a later week.
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for your feedback! 🎉')),
    );

    // Reset the form for a fresh entry, keep the program name.
    _nameController.clear();
    _commentController.clear();
    setState(() {
      _rating = 0;
      _ratingTouched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final showRatingError = _ratingTouched && _rating == 0;

    return ExScaffold(
      appBar: AppBar(title: const Text('Leave Feedback'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.rate_review_outlined,
                      size: 48,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Share Your Feedback',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your input helps us improve future programs',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // --- Program Name (pre-filled, read-only) ---
              ExTextField(
                controller: _programNameController,
                labelText: 'Program Name',
                enabled: false,
                prefixIcon: const Icon(Icons.school_outlined),
              ),
              const SizedBox(height: 24),

              // --- Star Rating ---
              Text('Your Rating', style: theme.textTheme.labelLarge),
              const SizedBox(height: 8),
              _StarRatingRow(
                rating: _rating,
                onChanged: (value) {
                  setState(() => _rating = value);
                },
              ),
              if (showRatingError) ...[
                const SizedBox(height: 6),
                Text(
                  'Please select at least 1 star',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              const SizedBox(height: 24),

              // --- Your Name ---
              ExTextField(
                controller: _nameController,
                labelText: 'Your Name',
                hintText: 'Enter your name',
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                prefixIcon: const Icon(Icons.person_outline),
                validator: _validateName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 20),

              // --- Comment / Review ---
              ExTextField(
                controller: _commentController,
                labelText: 'Comment / Review',
                hintText: 'Tell us what you thought of this program...',
                maxLines: 4,
                minLines: 3,
                textInputAction: TextInputAction.newline,
                validator: _validateComment,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 32),

              // --- Submit button (shared ExPrimaryButton) ---
              ExPrimaryButton(
                onPressed: _handleSubmit,
                child: const Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A simple 1–5 star rating selector.
///
/// Local to this screen since the shared design system doesn't yet
/// have a star-rating component. If one gets added later, swap this
/// out for the shared version.
class _StarRatingRow extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onChanged;

  const _StarRatingRow({required this.rating, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: List.generate(5, (index) {
        final starValue = index + 1;
        final filled = starValue <= rating;
        return IconButton(
          onPressed: () => onChanged(starValue),
          iconSize: 32,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          constraints: const BoxConstraints(),
          icon: Icon(
            filled ? Icons.star_rounded : Icons.star_border_rounded,
            color: filled
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurfaceVariant,
          ),
        );
      }),
    );
  }
}

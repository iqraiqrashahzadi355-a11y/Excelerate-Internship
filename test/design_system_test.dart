import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:excelerate_internship/design_system/design_system.dart';
import 'package:excelerate_internship/main_design_system.dart';
import 'package:excelerate_internship/debug/design_system_demo.dart';

void main() {
  group('Design System Tests', () {
    testWidgets('LivingDesignSystemPage renders in debug mode', (tester) async {
      await tester.pumpWidget(const DesignSystemApp());
      expect(find.byType(LivingDesignSystemPage), findsOneWidget);
      expect(find.text('Excelerate Demo'), findsOneWidget);
    });

    testWidgets('ExPrimaryButton renders and responds to taps', (tester) async {
      bool tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: ExPrimaryButton(
              onPressed: () => tapped = true,
              child: const Text('Tap Me'),
            ),
          ),
        ),
      );

      expect(find.text('Tap Me'), findsOneWidget);
      await tester.tap(find.byType(ExPrimaryButton));
      expect(tapped, isTrue);
    });

    testWidgets('ExPrimaryButton meets accessibility guidelines', (
      tester,
    ) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: ExPrimaryButton(
              onPressed: () {},
              child: const Text('Accessible Button'),
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(ExPrimaryButton)),
        matchesSemantics(
          isButton: true,
          hasTapAction: true,
          hasFocusAction: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
          label: 'Accessible Button',
        ),
      );
      handle.dispose();
    });

    testWidgets('Dark mode component rendering (ExCard)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.darkTheme,
          home: const Scaffold(body: ExCard(child: Text('Dark Card'))),
        ),
      );

      final cardFinder = find.byType(Card);
      expect(cardFinder, findsOneWidget);
      final Card card = tester.widget(cardFinder);

      expect(card.color, isNull);
    });

    testWidgets('ExTextField validates form input and forwards callbacks', (
      tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      String? savedValue;
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: Form(
              key: formKey,
              child: ExTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: (value) => value != 'student@example.com'
                    ? 'Enter a valid email'
                    : null,
                onChanged: (value) => changedValue = value,
                onSaved: (value) => savedValue = value,
              ),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'invalid');
      expect(changedValue, 'invalid');
      expect(formKey.currentState!.validate(), isFalse);
      await tester.pump();
      expect(find.text('Enter a valid email'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), 'student@example.com');
      expect(formKey.currentState!.validate(), isTrue);
      formKey.currentState!.save();
      expect(savedValue, 'student@example.com');
    });

    testWidgets('ExPrimaryButton exposes a loading state for async work', (
      tester,
    ) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: ExPrimaryButton(
              onPressed: () => completer.future,
              child: const Text('Save'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ExPrimaryButton));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      completer.complete();
      await tester.pump();
      expect(find.text('Save'), findsOneWidget);
    });

    testWidgets('Progress indicators validate values and expose semantics', (
      tester,
    ) async {
      expect(
        () => WavyCircularProgressIndicator(value: 1.1),
        throwsAssertionError,
      );
      expect(
        () => WavyLinearProgressIndicator(height: 4, waveAmplitude: 4),
        throwsAssertionError,
      );

      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: WavyCircularProgressIndicator(
              value: 0.5,
              semanticsLabel: 'Upload progress',
            ),
          ),
        ),
      );

      expect(
        tester.getSemantics(find.byType(WavyCircularProgressIndicator)),
        matchesSemantics(label: 'Upload progress', value: '50%'),
      );
      handle.dispose();
    });

    testWidgets('ExAvatar provides an image error fallback handler', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: const Scaffold(
            body: ExAvatar(
              initials: 'EX',
              imageUrl: 'https://invalid.example/avatar.png',
            ),
          ),
        ),
      );

      final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
      expect(avatar.foregroundImage, isA<NetworkImage>());
      expect(avatar.onForegroundImageError, isNotNull);
      expect(find.text('EX'), findsOneWidget);
    });

    testWidgets('Golden test for LivingDesignSystemPage', (tester) async {
      // Set physical size for consistent goldens
      tester.view.physicalSize = const Size(1080, 1920);
      tester.view.devicePixelRatio = 3.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(const DesignSystemApp());
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(LivingDesignSystemPage),
        matchesGoldenFile('goldens/design_system_demo.png'),
      );
    });

    testWidgets(
      'Dark-state golden covers form errors, loading, and reduced motion',
      (tester) async {
        tester.view.physicalSize = const Size(1080, 1080);
        tester.view.devicePixelRatio = 3.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MaterialApp(
            theme: AppTheme.darkTheme,
            home: MediaQuery(
              data: const MediaQueryData(disableAnimations: true),
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ExTextField(
                        labelText: 'Email',
                        errorText: 'Enter a valid email',
                      ),
                      SizedBox(height: 16),
                      ExPrimaryButton(
                        onPressed: null,
                        isLoading: true,
                        child: Text('Save'),
                      ),
                      SizedBox(height: 16),
                      ExAvatar(initials: 'EX'),
                      SizedBox(height: 16),
                      WavyCircularProgressIndicator(
                        value: 0.5,
                        semanticsLabel: 'Upload progress',
                      ),
                      SizedBox(height: 16),
                      WavyLinearProgressIndicator(
                        value: 0.5,
                        semanticsLabel: 'Upload progress',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('goldens/design_system_states_dark.png'),
        );
      },
    );
  });
}

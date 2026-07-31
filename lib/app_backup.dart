/// The root [MaterialApp] widget for Excelerate Learning Platform.
///
/// Configures theming, routing, and scroll behavior. This file is the
/// single source of truth for app-level configuration — [main.dart]
/// only calls [runApp].
///
/// See also:
///   - [AppTheme] for theme configuration.
///   - [AppRoutes] for route constants.
library;
import 'package:flutter/material.dart';

import 'design_system/design_system.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/program_details_screen.dart';
import 'screens/program_listing_screen.dart';

/// Root widget that configures [MaterialApp] with the Excelerate theme,
/// routes, and behavior.
class ExcelerateLearningApp extends StatelessWidget {
  const ExcelerateLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Excelerate Learning Platform',
      debugShowCheckedModeBanner: false,

      // Theme — delegates to the design system's AppTheme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      scrollBehavior: const MaterialScrollBehavior(),

      // Routes
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.programs: (context) => const ProgramListingScreen(),
        AppRoutes.details: (context) => const ProgramDetailsScreen(),
      },
    );
  }
}

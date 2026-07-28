import 'package:flutter/material.dart';
import 'app.dart';

/// Application entry point.
///
/// Delegates all configuration (theme, routing, behavior) to [ExcelerateLearningApp]
/// in [app.dart]. This file should remain minimal — any app-level setup
/// (Firebase.initializeApp, etc.) goes here before [runApp].

import 'screens/program_listing_screen.dart';
import 'services/program_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final loadedPrograms = await ProgramRepository().loadPrograms();
    if (loadedPrograms.isNotEmpty) {
      ProgramListingScreen.programs = loadedPrograms;
    }
  } catch (e) {
    debugPrint('Failed to load programs: $e');
  }
  
  runApp(const ExcelerateLearningApp());
}

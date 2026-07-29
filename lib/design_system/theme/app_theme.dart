import 'package:flutter/material.dart';

import '../tokens/elevations.dart';
import '../tokens/radii.dart';
import '../tokens/spacing.dart';
import 'ex_color_scheme.dart';
import 'ex_typography.dart';
import 'semantic_colors.dart';

/// Central theme assembly for the Excelerate design system.
///
/// Composes color schemes, typography, and component themes into complete
/// [ThemeData] objects. This is the only file that touches [ThemeData]
/// directly — all other theme concerns are delegated to:
/// - [ExColorScheme] — color definitions
/// - [ExTypography] — font configuration
///
/// Usage:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.lightTheme,
///   darkTheme: AppTheme.darkTheme,
///   themeMode: ThemeMode.system,
/// )
/// ```

/// Assembles the final [ThemeData] for the Excelerate app.
///
/// Access via [AppTheme.lightTheme] and [AppTheme.darkTheme].
class AppTheme {
  const AppTheme._();

  // ──────────────────────────────────────────────────────────────────────────
  // Component themes
  // ──────────────────────────────────────────────────────────────────────────

  static final FilledButtonThemeData _filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusFull),
      padding: const EdgeInsets.symmetric(
        horizontal: ExSpacing.lg,
        vertical: ExSpacing.md,
      ),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusFull),
          padding: const EdgeInsets.symmetric(
            horizontal: ExSpacing.lg,
            vertical: ExSpacing.md,
          ),
        ),
      );

  static const PageTransitionsTheme _pageTransitionsTheme =
      PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        },
      );

  static final TextButtonThemeData _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusFull),
      padding: const EdgeInsets.symmetric(
        horizontal: ExSpacing.md,
        vertical: ExSpacing.sm,
      ),
    ),
  );

  static final IconButtonThemeData _iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusFull),
    ),
  );

  static final CardThemeData _cardTheme = CardThemeData(
    elevation: ExElevations.level0,
    shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusLg),
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.zero,
  );

  static final InputDecorationTheme _inputDecorationTheme =
      const InputDecorationTheme(
        filled: true,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ExRadii.sm),
            topRight: Radius.circular(ExRadii.sm),
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ExRadii.sm),
            topRight: Radius.circular(ExRadii.sm),
          ),
          borderSide: BorderSide(width: 2.0),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: ExSpacing.md,
          vertical: ExSpacing.md,
        ),
      );

  static final ChipThemeData _chipTheme = ChipThemeData(
    shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusFull),
    padding: const EdgeInsets.symmetric(
      horizontal: ExSpacing.md,
      vertical: ExSpacing.sm,
    ),
  );

  static final SnackBarThemeData _snackBarTheme = SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusMd),
  );

  static final DialogThemeData _dialogTheme = DialogThemeData(
    shape: RoundedRectangleBorder(borderRadius: ExRadii.borderRadiusXl),
  );

  static final BottomSheetThemeData _bottomSheetTheme =
      const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(ExRadii.xl)),
        ),
      );

  static const AppBarTheme _appBarTheme = AppBarTheme(
    centerTitle: false,
    elevation: ExElevations.level0,
    scrolledUnderElevation: ExElevations.level1,
  );

  static const NavigationBarThemeData _navigationBarTheme =
      NavigationBarThemeData(
        elevation: ExElevations.level2,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      );

  static const ProgressIndicatorThemeData _progressIndicatorTheme =
      ProgressIndicatorThemeData(
        // Uses M3 defaults naturally
      );

  // ──────────────────────────────────────────────────────────────────────────
  // Assembled ThemeData
  // ──────────────────────────────────────────────────────────────────────────

  /// Complete dark theme for the app.
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ExColorScheme.dark,
    scaffoldBackgroundColor: ExColorScheme.dark.surface,
    useMaterial3: true,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    iconButtonTheme: _iconButtonTheme,
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
    chipTheme: _chipTheme,
    snackBarTheme: _snackBarTheme,
    dialogTheme: _dialogTheme,
    bottomSheetTheme: _bottomSheetTheme,
    appBarTheme: _appBarTheme,
    navigationBarTheme: _navigationBarTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: ExTypography.buildTextTheme(),
    extensions: const [SemanticColors.dark],
  );

  /// Complete light theme for the app.
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ExColorScheme.light,
    scaffoldBackgroundColor: ExColorScheme.light.surface,
    useMaterial3: true,
    filledButtonTheme: _filledButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    textButtonTheme: _textButtonTheme,
    iconButtonTheme: _iconButtonTheme,
    cardTheme: _cardTheme,
    inputDecorationTheme: _inputDecorationTheme,
    chipTheme: _chipTheme,
    snackBarTheme: _snackBarTheme,
    dialogTheme: _dialogTheme,
    bottomSheetTheme: _bottomSheetTheme,
    appBarTheme: _appBarTheme,
    navigationBarTheme: _navigationBarTheme,
    progressIndicatorTheme: _progressIndicatorTheme,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: ExTypography.buildTextTheme(),
    extensions: const [SemanticColors.light],
  );
}

import 'package:flutter/material.dart';

class MilaakColors {
  static const primary = Color(0xFFFF8C1A);
  static const primaryDark = Color(0xFFD96C08);
  static const primarySoft = Color(0xFFFFE3BF);
  static const charcoal = Color(0xFF2D2D2D);
  static const ink = Color(0xFF121212);
  static const textPrimary = charcoal;
  static const textSoft = Color(0xFF64748B);
  static const muted = Color(0xFF94A3B8);
  static const background = Color(0xFFF7F8FC);
  static const warmBackground = Color(0xFFFFF8EF);
  static const surface = Color(0xFFFFFFFF);
  static const softSurface = Color(0xFFFDFDFE);
  static const border = Color(0xFFE5E7EB);
  static const coolBorder = border;
  static const collected = Color(0xFF22C55E);
  static const arrears = Color(0xFFEF4444);
  static const contractGold = Color(0xFFF59E0B);
  static const utilityBlue = Color(0xFF2563EB);

  // Compatibility aliases used by older widgets.
  static const royalBlue = primary;
  static const deepNavy = charcoal;
  static const slateTint = background;

  static const darkBackground = Color(0xFF0F1218);
  static const darkWarmBackground = Color(0xFF151A22);
  static const darkSurface = Color(0xFF171C24);
  static const darkSoftSurface = Color(0xFF1D2430);
  static const darkBorder = Color(0xFF2A3342);
  static const darkTextPrimary = Color(0xFFF5F7FB);
  static const darkTextSoft = Color(0xFF9AA6B5);
  static const darkMuted = Color(0xFF6F7B8B);
  static const glassLight = Color(0xDFFFFFFF);
  static const glassLightStrong = Color(0xECFFFFFF);
  static const glassLightBorder = Color(0x66FFFFFF);
  static const glassDark = Color(0xC3171C24);
  static const glassDarkStrong = Color(0xDE171C24);
  static const glassDarkBorder = Color(0x54FFFFFF);

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color backgroundFor(BuildContext context) =>
      isDark(context) ? darkBackground : background;

  static Color warmBackgroundFor(BuildContext context) =>
      isDark(context) ? darkWarmBackground : warmBackground;

  static Color surfaceFor(BuildContext context) =>
      isDark(context) ? darkSurface : surface;

  static Color softSurfaceFor(BuildContext context) =>
      isDark(context) ? darkSoftSurface : softSurface;

  static Color glassSurfaceFor(BuildContext context, {bool strong = false}) =>
      isDark(context)
      ? (strong ? glassDarkStrong : glassDark)
      : (strong ? glassLightStrong : glassLight);

  static Color glassBorderFor(BuildContext context) =>
      isDark(context) ? glassDarkBorder : glassLightBorder;

  static Color borderFor(BuildContext context) =>
      isDark(context) ? darkBorder : border;

  static Color textPrimaryFor(BuildContext context) =>
      isDark(context) ? darkTextPrimary : textPrimary;

  static Color textSoftFor(BuildContext context) =>
      isDark(context) ? darkTextSoft : textSoft;

  static Color mutedFor(BuildContext context) =>
      isDark(context) ? darkMuted : muted;
}

class MilaakRadii {
  static const double xs = 10;
  static const double sm = 14;
  static const double md = 16;
  static const double lg = 18;
  static const double xl = 26;
}

class MilaakSpacing {
  static const double page = 18;
  static const double card = 16;
  static const double gap = 12;
  static const double floatingDockBottomInset = 116;
}

class MilaakShadows {
  static List<BoxShadow> soft([Color color = const Color(0xFF0F172A)]) => [
    BoxShadow(
      color: color.withValues(alpha: .08),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> lift([Color color = const Color(0xFFF28A18)]) => [
    BoxShadow(
      color: color.withValues(alpha: .18),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}

class MilaakTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: MilaakColors.primary,
      brightness: Brightness.light,
      primary: MilaakColors.primary,
      secondary: MilaakColors.charcoal,
      error: MilaakColors.arrears,
      surface: MilaakColors.surface,
    );

    const textColor = MilaakColors.textPrimary;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: 'Tajawal',
      fontFamilyFallback: const ['NotoNaskhArabic'],
      scaffoldBackgroundColor: MilaakColors.background,
      visualDensity: VisualDensity.standard,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w900,
        ),
        headlineSmall: TextStyle(color: textColor, fontWeight: FontWeight.w900),
        titleLarge: TextStyle(color: textColor, fontWeight: FontWeight.w900),
        titleMedium: TextStyle(color: textColor, fontWeight: FontWeight.w800),
        titleSmall: TextStyle(color: textColor, fontWeight: FontWeight.w800),
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
        labelLarge: TextStyle(color: textColor, fontWeight: FontWeight.w800),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withValues(alpha: .70),
        foregroundColor: MilaakColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 62,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: MilaakColors.surface,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          side: const BorderSide(color: MilaakColors.border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MilaakColors.softSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(color: MilaakColors.muted),
        labelStyle: const TextStyle(color: MilaakColors.textSoft),
        prefixIconColor: MilaakColors.primary,
        suffixIconColor: MilaakColors.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.primary, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.arrears),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: MilaakColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: MilaakColors.border),
          foregroundColor: MilaakColors.textPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MilaakColors.primaryDark,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: MilaakColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? MilaakColors.primary
                : MilaakColors.softSurface,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? Colors.white
                : MilaakColors.textPrimary,
          ),
          side: WidgetStateProperty.resolveWith(
            (states) => BorderSide(
              color: states.contains(WidgetState.selected)
                  ? MilaakColors.primary
                  : MilaakColors.border,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: MilaakColors.charcoal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: MilaakColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  static ThemeData get dark {
    final scheme = ColorScheme.fromSeed(
      seedColor: MilaakColors.primary,
      brightness: Brightness.dark,
      primary: MilaakColors.primary,
      secondary: const Color(0xFFF5F7FB),
      surface: MilaakColors.darkSurface,
      error: MilaakColors.arrears,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      fontFamily: 'Tajawal',
      fontFamilyFallback: const ['NotoNaskhArabic'],
      scaffoldBackgroundColor: MilaakColors.darkBackground,
      visualDensity: VisualDensity.standard,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: MilaakColors.darkTextPrimary,
          fontWeight: FontWeight.w900,
        ),
        headlineSmall: TextStyle(
          color: MilaakColors.darkTextPrimary,
          fontWeight: FontWeight.w900,
        ),
        titleLarge: TextStyle(
          color: MilaakColors.darkTextPrimary,
          fontWeight: FontWeight.w900,
        ),
        titleMedium: TextStyle(
          color: MilaakColors.darkTextPrimary,
          fontWeight: FontWeight.w800,
        ),
        titleSmall: TextStyle(
          color: MilaakColors.darkTextPrimary,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(color: MilaakColors.darkTextPrimary),
        bodyMedium: TextStyle(color: MilaakColors.darkTextPrimary),
        labelLarge: TextStyle(
          color: MilaakColors.darkTextPrimary,
          fontWeight: FontWeight.w800,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withValues(alpha: .06),
        foregroundColor: MilaakColors.darkTextPrimary,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 62,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: MilaakColors.darkSurface,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          side: const BorderSide(color: MilaakColors.darkBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MilaakColors.darkSoftSurface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        hintStyle: const TextStyle(color: MilaakColors.darkMuted),
        labelStyle: const TextStyle(color: MilaakColors.darkTextSoft),
        prefixIconColor: MilaakColors.primary,
        suffixIconColor: MilaakColors.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.primary, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(MilaakRadii.lg),
          borderSide: const BorderSide(color: MilaakColors.arrears),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: MilaakColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(54),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(color: MilaakColors.darkBorder),
          foregroundColor: MilaakColors.darkTextPrimary,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: MilaakColors.primarySoft,
          textStyle: const TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: MilaakColors.darkTextPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? MilaakColors.primary.withValues(alpha: .18)
                : MilaakColors.darkSoftSurface,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? Colors.white
                : MilaakColors.darkTextPrimary,
          ),
          side: WidgetStateProperty.resolveWith(
            (states) => BorderSide(
              color: states.contains(WidgetState.selected)
                  ? MilaakColors.primary.withValues(alpha: .35)
                  : MilaakColors.darkBorder,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: MilaakColors.darkSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: MilaakColors.darkSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}

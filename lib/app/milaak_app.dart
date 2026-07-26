import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.dart';
import '../data/repositories/rental_repositories.dart';
import 'theme.dart';

class MilaakApp extends ConsumerWidget {
  const MilaakApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeValue = ref.watch(themeModeProvider).valueOrNull ?? 'system';
    return MaterialApp.router(
      title: 'مِلاك',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: MilaakTheme.light,
      darkTheme: MilaakTheme.dark,
      themeMode: _themeModeFromValue(themeModeValue),
      themeAnimationDuration: const Duration(milliseconds: 220),
      themeAnimationCurve: Curves.easeOutCubic,
      routerConfig: appRouter,
    );
  }
}

ThemeMode _themeModeFromValue(String value) {
  return switch (value) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };
}

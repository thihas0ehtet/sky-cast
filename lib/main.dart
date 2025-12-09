import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/config/app_constants.dart';
import 'package:sky_cast/core/config/app_theme.dart';
import 'package:sky_cast/routes/app_router.dart';

void main() {
  runApp(const ProviderScope(child: SkyCastApp()));
}

class SkyCastApp extends StatelessWidget {
  const SkyCastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appTitle,
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

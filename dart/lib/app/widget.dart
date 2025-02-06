import 'package:flutter/material.dart';
import './theme/theme_data.dart';
import './router.dart';

class FckUpFlutterApp extends StatelessWidget {
  const FckUpFlutterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'FckUpFlutterApp',
      theme: AppTheme.lightTheme,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}


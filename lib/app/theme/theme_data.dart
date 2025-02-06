import 'package:flutter/material.dart';
import 'package:flutter_learning/widgets/search/ui/theme/colors.dart';
import '../../shared/theme/theme_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ThemeColor.secondaryWhite,
      colorScheme: _colorScheme,
      appBarTheme: _appBarTheme,
      textTheme: _textTheme,
      iconTheme: _iconTheme,
      extensions: <ThemeExtension<dynamic>>[
        SearchHeaderThemeColors.light
      ]
    );
  }
}

ColorScheme _colorScheme = ColorScheme.fromSeed(
  seedColor: ThemeColor.accent,
);

AppBarTheme _appBarTheme = const AppBarTheme(
  centerTitle: true,
  toolbarHeight: 0,
  // titleTextStyle: const TextStyle(
  //   fontSize: 20,
  //   fontWeight: FontWeight.bold,
  //   color: ThemeColor.white,
  // ),
  // iconTheme: _iconTheme.copyWith(
  //   color: ThemeColor.white,
  // ),
  // backgroundColor: ThemeColor.black,
  // scrolledUnderElevation: 0.0,
);

const TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  displayMedium: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  displaySmall: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  headlineLarge: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  headlineMedium: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  headlineSmall: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  titleLarge: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  titleMedium: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  titleSmall: TextStyle(
    color: ThemeColor.black,
    fontWeight: FontWeight.bold,
    height: 1,
  ),
  labelLarge: TextStyle(
    color: ThemeColor.black,
    height: 1,
  ),
  labelMedium: TextStyle(
    color: ThemeColor.black,
    height: 1,
  ),
  labelSmall: TextStyle(
    color: ThemeColor.black,
    height: 1,
  ),
  bodyLarge: TextStyle(
    color: ThemeColor.black,
    height: 1,
  ),
  bodyMedium: TextStyle(
    color: ThemeColor.black,
    height: 1,
  ),
  bodySmall: TextStyle(
    color: ThemeColor.black,
    height: 1,
  ),
);

const IconThemeData _iconTheme = IconThemeData(
  color: ThemeColor.black,
  size: 24,
);

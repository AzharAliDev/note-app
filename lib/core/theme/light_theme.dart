import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        primarySwatch: Colors.brown,
        appBarTheme: const AppBarTheme(elevation: 0.0),
        cardTheme: CardTheme(
          elevation: 8.0,
          shadowColor: Colors.grey.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      );
}

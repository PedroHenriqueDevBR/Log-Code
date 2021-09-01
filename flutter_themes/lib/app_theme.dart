import 'package:flutter/material.dart';

class AppTheme {
  Color primary = Colors.red;
  Color accent = Colors.orange;

  ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.yellow,
      primaryColor: primary,
      accentColor: accent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: primary,
          padding: EdgeInsets.all(16.0),
          onPrimary: Colors.white,
        ),
      ),
    );
  }

  BoxDecoration pizzaContainer() {
    return BoxDecoration(
      color: primary,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get appStyle => ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0),
            primary: Colors.green,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 30),
        ),
      );
}

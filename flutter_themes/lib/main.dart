import 'package:flutter/material.dart';
import 'package:flutter_themes/app_theme.dart';
import 'package:flutter_themes/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppTheme _appTheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _appTheme.theme(),
      home: MyHomePage(),
    );
  }
}

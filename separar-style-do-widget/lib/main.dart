import 'package:estilizacao/app_theme.dart';
import 'package:estilizacao/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  AppTheme style = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: style.appStyle,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

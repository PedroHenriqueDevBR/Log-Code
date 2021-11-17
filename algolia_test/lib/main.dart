import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:angolia_test/app/modules/home/views/home_view.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  MaterialColor primary = Colors.indigo;

  void changeNavigatorColor() {
    SystemUiOverlayStyle systemTheme = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: primary,
      systemNavigationBarColor: primary,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
  }

  @override
  Widget build(BuildContext context) {
    changeNavigatorColor();
    return MaterialApp(
      title: 'Angolia Demo',
      theme: ThemeData(
        primarySwatch: primary,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

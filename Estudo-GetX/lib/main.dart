import 'package:flutter/material.dart';
import 'package:novo_teste/app/data/providers/hive_service.dart';
import 'package:novo_teste/app/shared/app.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive();
  runApp(App());
}

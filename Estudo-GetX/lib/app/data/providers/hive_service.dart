import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static const String TODO_BOX = 'todo_box';

  static Future<void> initHive() async {
    if (!_isBoxOpen(TODO_BOX)) {
      Directory dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      await Hive.openBox(TODO_BOX);
    }
  }

  static bool _isBoxOpen(String boxName) {
    final open = Hive.isBoxOpen(boxName);
    if (open) {
      print('Box $boxName is open');
    } else {
      print('Box $boxName is closed');
    }
    return open;
  }

  Future<void> saveData(String key, dynamic value) async {
    if (value != null) {
      await Hive.box(TODO_BOX).put(key, value);
    }
  }

  Future<dynamic> getData(String key) async {
    return await Hive.box(TODO_BOX).get(key);
  }

  Future<void> removeData(String key) async {
    await Hive.box(TODO_BOX).delete(key);
  }

  Future<void> updateData(String key, dynamic value) async {
    if (value != null) {
      await Hive.box(TODO_BOX).put(key, value);
    }
  }
}

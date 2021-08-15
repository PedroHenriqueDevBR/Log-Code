import 'dart:async';

import 'package:flutter_desktop_sqlite/src/shared/dao/sql.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ConnectionSQLiteService {
  ConnectionSQLiteService._();

  static ConnectionSQLiteService? _instance;

  static ConnectionSQLiteService get instance {
    _instance ??= ConnectionSQLiteService._();
    return _instance!;
  }

  /* ============================================= */

  static const DATABASE_NAME = 'contatos.db';
  static const DATABASE_VERSION = 1;
  Database? _db;

  Future<Database> get db => _openDatabase();

  Future<Database> _openDatabase() async {
    sqfliteFfiInit();
    String databasePath = await databaseFactoryFfi.getDatabasesPath();
    String path = join(databasePath, DATABASE_NAME);
    DatabaseFactory databaseFactory = databaseFactoryFfi;

    if (_db == null) {
      _db = await databaseFactory.openDatabase(path,
          options: OpenDatabaseOptions(
              onCreate: _onCreate, version: DATABASE_VERSION));
    }
    return _db!;
  }

  FutureOr<void> _onCreate(Database db, int version) {
    db.transaction((reference) async {
      reference.execute(ConnectionSQL.CREATE_DATABASE);
    });
  }
}

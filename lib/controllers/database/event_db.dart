import 'package:sqflite/sqflite.dart' as sql;

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class EventDB {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'events.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE events(id TEXT PRIMARY KEY, name TEXT, subName TEXT, description TEXT, location TEXT, time TEXT, date TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final sqlDB = await database();

    sqlDB.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, String id) async {
    final sqlDB = await database();

    await sqlDB.rawDelete(
      'DELETE FROM $table WHERE id = ?',
      [id],
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final sqlDB = await database();
    return sqlDB.query(table);
  }
}

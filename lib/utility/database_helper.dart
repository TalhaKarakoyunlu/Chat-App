import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import 'package:chat_app/models/users_model.dart';

class DatabaseHelper {

  static const int _version = 1;
  static const String _db_name = 'chats.db';

  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _db_name),
      onCreate: (db, version) async => await db.execute("CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE NOT NULL, email TEXT NOT NULL, password TEXT NOT NULL);"),
      version: _version
    );
  }

  static Future<int> insertUser(Users user) async {
    final db = await _openDB();
    return await db.insert("Users", user.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUser(Users user) async {
    final db = await _openDB();
    return await db.update("Users", user.toJson(), where: 'id=?', whereArgs: [user.id], conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteUser(Users user) async {
    final db = await _openDB();
    return await db.delete("Users", where: 'id=?', whereArgs: [user.id]);
  }

  static Future<List<Users>?> showUsers() async {
    final db = await _openDB();

    final List<Map<String, dynamic>> maps = await db.query("Users");

    if (maps.isEmpty) {
      return null;
    }

    return List.generate(maps.length, (index) => Users.fromJson(maps[index]));
  }

}

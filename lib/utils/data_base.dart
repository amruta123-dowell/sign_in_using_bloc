import 'package:flutter_bloc_sign_in/models/user_details_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static DatabaseHelper? _singleton;

  factory DatabaseHelper() {
    if (_singleton != null) {
      return _singleton!;
    } else {
      _singleton = DatabaseHelper.internal();
      return _singleton!;
    }
  }

  DatabaseHelper.internal() {}

  static Database? _database;
  final String tableName = "userDetailsTable";

  Future<Database> get dataBase async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final tempPath = await getDatabasesPath();
    final dbPath = path.join(tempPath, tableName);

    return await openDatabase(dbPath, version: 1,
        onCreate: (db, version) async {
      await db.execute('''
     CREATE TABLE $tableName(id INTEGER PRIMARY KEY, email TEXT, password TEXT)
''');
    });
  }

  Future<int> insertUser(UserDetailsModel user) async {
    final db = await dataBase;
    return await db.insert(tableName, user.toMap());
  }

  Future<UserDetailsModel?> getUserData(int userId) async {
    final db = await dataBase;
    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: "id=?", whereArgs: [userId]);

    //check whether data is returned or not
    if (maps.isNotEmpty) {
      print("abc");
      return UserDetailsModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<void> updateUserDetails(UserDetailsModel userData) async {
    final db = await dataBase;
    String sql = '''
 UPDATE $tableName SET email=?, password=? 
 WHERE id=?
''';
    db.rawUpdate(sql, [userData.email, userData.password, userData.id]);
  }

  Future<void> deleteUser(String id) async {
    final db = await dataBase;
    String sql = """DELETE FROM $tableName WHERE id=?""";
    await db.rawDelete(sql, [id]);

    await db.close();
  }

  Future<List<Map<String, dynamic>>> getUserDetails() async {
    final db = await dataBase;
    List<Map<String, dynamic>> userData = await db.query(tableName);

    return await db.query(tableName);
  }
}

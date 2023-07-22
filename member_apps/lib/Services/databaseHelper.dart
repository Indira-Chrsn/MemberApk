import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class databaseHelper {
  static const int _version = 1;
  static const String _dbName = "memberApk.db";

  static Future<Database> getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        onCreate: ((db, version) async => {
      await db.execute(
          'PRAGMA foreign_keys = ON'), //PRAGMA to enable foreign key constraints
      await _createDatabase(db, _version)
    }));
  }

  static Future<void> _createDatabase(Database db, int _version) async {
    await db.execute('''
      CREATE TABLE [IF NOT EXIST] users(
        userID INTEGER PRIMARY KEY, 
        username TEXT NOT NULL, 
        email VARCHAR NOT NULL, 
        password TEXT NOT NULL, 
        phoneNumber VARCHAR NOT NULL, 
        DateOfBirth DATE NOT NULL, 
        userStatus TEXT NOT NULL),
    ''');

    await db.execute('''
      CREATE TABLE [IF NOT EXIST] store(
        storeID INTEGER PRIMARY KEY, 
        name TEXT NOT NULL, 
        city TEXT NOT NULL, 
        telephone VARCHAR NOT NULL, 
        member_amount INTEGER)
    ''');

    await db.execute('''
      CREATE TABLE [IF NOT EXIST] service(
        serviceID INTEGER PRIMARY KEY AUTOINCREMENT,
        userID INTEGER,
        storeID INTEGER,
        status TEXT NOT NULL,
        startDate DATE NOT NULL,
        finishDate DATE NOT NULL,
        FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE,
        FOREIGN KEY (tokoID) REFERENCES store(storeID) ON DELETE CASCADE
        )
    ''');
  }
}

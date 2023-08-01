import 'package:flutter/material.dart';
import 'package:member_apps/Models/membership_model.dart';
import 'package:member_apps/Models/service_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:member_apps/Models/user_model.dart';

class databaseHelper {
  static const int _version = 1;
  static const String _dbName = "memberApk.db";
  static Database? _database;

  static final String createTableUser = '''
  CREATE TABLE users(
        userID INTEGER PRIMARY KEY AUTOINCREMENT, 
        username TEXT NOT NULL, 
        email VARCHAR NOT NULL, 
        password TEXT NOT NULL, 
        phoneNumber VARCHAR NOT NULL, 
        DateOfBirth DATE NOT NULL, 
        userStatus TEXT NOT NULL,
        points INTEGER DEFAULT 0,
        storeID INTEGER NOT NULL)
  ''';

  static final String createTableStore = '''
  CREATE TABLE store(
        storeID INTEGER PRIMARY KEY AUTOINCREMENT,
        memberID INTEGER, 
        name TEXT NOT NULL, 
        city TEXT NOT NULL, 
        telephone VARCHAR NOT NULL, 
        member_amount INTEGER,
        FOREIGN KEY (memberID) REFERENCES users(userID) ON DELETE CASCADE)
  ''';

  static final String createTableService = '''
  CREATE TABLE service(
        serviceID INTEGER PRIMARY KEY AUTOINCREMENT,
        userID INTEGER,
        storeID INTEGER,
        status TEXT NOT NULL,
        startDate INTEGER NOT NULL,
        finishDate INTEGER NOT NULL,
        FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE,
        FOREIGN KEY (storeID) REFERENCES store(storeID) ON DELETE CASCADE)
  ''';

  static final String createTableMembership = '''
  CREATE TABLE membership(
        membershipID INTEGER PRIMARY KEY AUTOINCREMENT,
        userID INTEGER,
        storeID INTEGER,
        joinDate INTEGER NOT NULL,
        FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE,
        FOREIGN KEY (storeID) REFERENCES store(storeID) ON DELETE CASCADE)
  ''';

// open and initialize database

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
        version: _version, onCreate: (db, version) async {
      await db.execute(
          'PRAGMA foreign_keys = ON'); //PRAGMA to enable foreign key constraints
      await db.execute(createTableUser);
      await db.execute(createTableStore);
      await db.execute(createTableService);
      await db.execute(createTableMembership);
    });
  }

  Future<bool> isDatabaseConnected() async {
    try {
      final db = await initDB();
      return db.isOpen;
    } catch (e) {
      return false;
    }
  }

  /*
  User helper
  */

  // get user by email/phoneNumber
  Future<users?> getMemberByPhoneNum(String phoneNum) async {
    final db = await database;
    final maps = await db
        .query('users', where: 'phoneNumber = ?', whereArgs: [phoneNum]);

    if (maps.isEmpty) {
      return null;
    }

    return users.fromJson(maps.first);
  }

  Future<users?> getMemberByEmail(String email) async {
    final db = await database;
    final maps =
        await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (maps.isEmpty) {
      return null;
    }

    return users.fromJson(maps.first);
  }

  Future<List<Map<String, dynamic>>> getAllUser() async {
    final db = await database;

    return await db.query('users');
  }

// register
  Future<int?> registerUser(users user) async {
    final db = await database;
    await db.insert('users', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int?> _becomeMember(membership newMember) async {
    final db = await database;
    await db.insert('membership', newMember.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /*
  admin helper
  */
  Future<void> _addPoints(users member, int pointsToAdd) async {
    final db = await database;
    final currentPoints = member.points;
    final totalPoints = currentPoints! + pointsToAdd;

    await db.update('users', {'points': totalPoints},
        where: 'id = ?', whereArgs: [member.userID]);
  }

  /*
  Service Helper
  */
  Future<int> _addService(service service) async {
    final db = await database;

    return await db.insert('service', service.toJson());
  }

  Future<void> _editServiceStatus(int serviceID, String newStatus) async {
    final db = await database;
    final value = {'status': newStatus};
    await db.update('service', value,
        where: 'serviceID = ?', whereArgs: [serviceID]);
  }

  /*general helper (login, logout)
  */
}

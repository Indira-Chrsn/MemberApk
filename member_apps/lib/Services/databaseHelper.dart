import 'package:flutter/material.dart';
import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
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
  CREATE TABLE "users" (
    "userID"	INTEGER NOT NULL,
    "username"	TEXT NOT NULL,
    "email"	TEXT NOT NULL UNIQUE,
    "password"	TEXT NOT NULL,
    "phoneNumber"	TEXT NOT NULL UNIQUE,
    "dateOfBirth"	INTEGER NOT NULL,
    "userStatus"	TEXT NOT NULL,
    "points"	INTEGER DEFAULT 0,
    "storeID"	INTEGER,
    PRIMARY KEY("userID" AUTOINCREMENT)
  )
  ''';

  static final String createTableStore = '''
  CREATE TABLE "store" (
	"storeID"	INTEGER NOT NULL,
	"name"	TEXT NOT NULL,
	"city"	TEXT NOT NULL,
	"telephone"	TEXT NOT NULL,
	"memberAmount"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("storeID" AUTOINCREMENT)
)
  ''';

  static final String createTableService = '''
  CREATE TABLE "service" (
	"serviceID"	INTEGER NOT NULL,
	"userID"	INTEGER,
	"storeID"	INTEGER,
	"status"	TEXT NOT NULL,
	"startDate"	INTEGER,
	"finishDate"	INTEGER,
	FOREIGN KEY("storeID") REFERENCES "store"("storeID") ON DELETE CASCADE,
	FOREIGN KEY("userID") REFERENCES "users"("userID") ON DELETE CASCADE,
	PRIMARY KEY("serviceID" AUTOINCREMENT)
)
  ''';

  static final String createTableMembership = '''
 CREATE TABLE "membership" (
	"membershipID"	INTEGER NOT NULL,
	"userID"	INTEGER,
	"storeID"	INTEGER,
	"joinDate"	INTEGER NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY("membershipID" AUTOINCREMENT),
	FOREIGN KEY("userID") REFERENCES "users"("userID") ON DELETE CASCADE,
	FOREIGN KEY("storeID") REFERENCES "store"("storeID") ON DELETE CASCADE
)
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
    // io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final db = await openDatabase(join(await getDatabasesPath(), _dbName),
        version: _version, onCreate: (db, version) async {
      await db.execute(
          'PRAGMA foreign_keys = ON'); //PRAGMA to enable foreign key constraints
      await db.execute(createTableUser);
      await db.execute(createTableStore);
      await db.execute(createTableService);
      await db.execute(createTableMembership);
    });

    return db;
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
  /* Future<users?> getMemberByPhoneNum(String phoneNum) async {
    final db = await database;
    final maps = await db
        .query('users', where: 'phoneNumber = ?', whereArgs: [phoneNum]);

    if (maps.isEmpty) {
      return null;
    }

    return users.fromJson(maps.first);
  } */

  Future<users?> getMemberByPhoneNum(String phoneNum) async {
    var db = await database;

    var res = await db.rawQuery(
        '''SELECT * FROM "users" WHERE phoneNumber = ?''', [phoneNum]);

    if (res.length > 0) {
      return users.fromJson(res.first);
    }

    return null;
  }

  Future<List<Map<String, dynamic>>> getMemberByEmail(String email) async {
    final db = await database;
    return await db
        .rawQuery('''SELECT * from "users" WHERE email = ?''', [email]);
  }

  Future<users?> getMemberByID(int userID) async {
    final db = await database;
    var result = await db
        .rawQuery('''SELECT * from "users" WHERE userID = ?''', [userID]);

    if (result.length > 0) {
      return users.fromJson(result.first);
    }

    return null;
  }

  Future<users?> getLoginUser(String emailOrPhoneNum, String password) async {
    var db = await database;

    var res = await db.rawQuery(
        '''SELECT * FROM "users" WHERE (email = ? OR phoneNumber = ?) AND password = ?''',
        [emailOrPhoneNum, emailOrPhoneNum, password]);

    if (res.length > 0) {
      return users.fromJson(res.first);
    }

    return null;
  }

/*
  Future<users?> getMemberByEmail(String email) async {
    final db = await database;
    final maps =
        await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (maps.isEmpty) {
      return null;
    }

    return users.fromJson(maps.first);
  } */

  Future<List<Map<String, dynamic>>> getAllUser() async {
    final db = await database;

    return await db.query('users');
  }

// register
  Future<void> registerUser(users user) async {
    final db =
        await database; //database is from get database function on line 67
    await db.insert('users', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> _becomeMember(membership newMember) async {
    final db = await database;
    return await db.insert('membership', newMember.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /*
  admin helper
  */
  Future<void> addPoints(String phoneNum, int totalPoints) async {
    final db = await database;
    // final currentPoints = member.points;
    // final totalPoints = currentPoints + pointsToAdd;

    await db.update('users', {'points': totalPoints},
        where: 'phoneNumber = ?', whereArgs: [phoneNum]);
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

  Future<List<Map<String, dynamic>>> fetchAllUser() async {
    final db = await database;
    return await db.rawQuery('''SELECT * from "users"''');
  }
}

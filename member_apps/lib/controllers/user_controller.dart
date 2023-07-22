import 'package:member_apps/Models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:member_apps/Services/databaseHelper.dart';


// register method
Future<int> _registerUser(Database db, int? id, String uname, String email,
    String password, String phoneNumber, int DOB, String userStatus) async {
  var newUser = users(
      userID: id,
      username: uname,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      dateOfBirth: DOB,
      userStatus: userStatus);

  final db = await databaseHelper.getDB();
  return await db.insert('users', newUser.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}


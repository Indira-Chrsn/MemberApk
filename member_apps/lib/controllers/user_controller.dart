import 'package:member_apps/Models/membership_model.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:member_apps/Services/databaseHelper.dart';

// user register method
/*Future<int> _registerUser(Database db, int? id, String uname, String email,
    String password, String phoneNumber, int DOB, String userStatus, int points, int? storeID) async {
  var newUser = users(
      userID: id,
      username: uname,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      dateOfBirth: DOB,
      userStatus: userStatus,
      points: points,
      storeID: storeID);

  final db = await databaseHelper.getDB();
  return await db.insert('users', newUser.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<int> becomeMember(Database db, int? membershipID, int? memberID,
    int? storeID, int joinDate) async {
  final db = await databaseHelper.getDB();
  var newMembership = membership(
      membershipID: memberID,
      memberID: memberID,
      storeID: storeID,
      joinDate: joinDate);
  return await db.insert('membership', newMembership.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}
*/
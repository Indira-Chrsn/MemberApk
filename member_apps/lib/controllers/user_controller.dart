import 'package:member_apps/Models/membership_model.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:member_apps/Services/databaseHelper.dart';

// user register method
Future<bool> userRegistered(
    String uname,
    String email,
    String password,
    String phoneNumber,
    int? DOB,
    String userStatus,) async {
  var newUser = users(
      username: uname,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      dateOfBirth: DOB,
      userStatus: userStatus,);

  databaseHelper dbHelper = databaseHelper();

  final checkUserByPhone = databaseHelper().getMemberByPhoneNum(phoneNumber);
  final checkUserByEmail = databaseHelper().getMemberByEmail(email);
  if (checkUserByPhone == null && checkUserByEmail == null) {
    databaseHelper().registerUser(newUser);
    return true;
  }

  return false;
}

/*
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
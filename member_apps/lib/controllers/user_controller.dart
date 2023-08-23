import 'package:member_apps/Models/membership_model.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:member_apps/Services/databaseHelper.dart';

class userController {
  databaseHelper dbHelper = databaseHelper();

// user register method
  Future<void> userRegistered(
    String uname,
    String email,
    String password,
    String phoneNumber,
    int DOB,
    String userStatus,
  ) async {
    final users newUser = users(
        username: uname,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        dateOfBirth: DOB,
        userStatus: userStatus,
        points: 0,
        storeID: 0);

    // final checkUserByPhone = await dbHelper.getMemberByPhoneNum(phoneNumber);
    // final checkUserByEmail = await dbHelper.getMemberByEmail(email);
    // if (checkUserByPhone == null && checkUserByEmail == null) {
    await dbHelper.registerUser(newUser);
    // return true;
    // }

    // return false;
  }

// fetch all user data
  Future<List<users>> fetchAllUser() async {
    final userData = await dbHelper.fetchAllUser();

    return userData.map((user) => users.fromJson(user)).toList();
  }

// add points
  Future<void> addPoints(int userID, int pointsToAdd) async {
    final user = await dbHelper.getMemberByID(userID);

    if (user != null) {
      final updatedPoints = user.userID! + pointsToAdd;
      await dbHelper.addPoints(userID, updatedPoints);
    }
  }
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
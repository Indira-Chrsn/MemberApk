import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/controllers/user_controller.dart';
import 'package:member_apps/pages/login_page.dart';

class index extends StatelessWidget {
  bool isDatabaseConnected = false;
  final userController _userController = userController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Database test"),
        ),
        body: FutureBuilder<List<users>>(
            future: _userController.fetchAllUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text("No users found.");
              } else {
                final users = snapshot.data!;
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      final dob = user.dateOfBirth;

                      if (dob != null) {
                        DateTime dateOfBirth =
                            DateTime.fromMillisecondsSinceEpoch(dob);
                        return ListTile(
                          title: Text(user.username),
                          subtitle: Text(user.email),
                          trailing: Text(dob.toString()),
                        );
                      } else {
                        return ListTile(
                          title: Text(user.username),
                          subtitle: Text(user.phoneNumber),
                          trailing: Text(user.points.toString()),
                        );
                      }
                    });
              }
            }));
  }
}

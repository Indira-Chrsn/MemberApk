import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/controllers/user_controller.dart';

class PointsPage extends StatefulWidget {
  // const PointsPage({super.key});
  users user;
  PointsPage({required this.user});

  @override
  PointsState createState() => PointsState(user);
}

class PointsState extends State<PointsPage> {
  users user;

  final phoneNumController = TextEditingController();
  final pointsController = TextEditingController();
  int? points;

  PointsState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Form(
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Text("Tambah Point"),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: phoneNumController,
              decoration: InputDecoration(labelText: "Enter phone number"),
            ),
            TextFormField(
              controller: pointsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Enter points"),
            ),
            ElevatedButton(
                onPressed: () {
                  if (phoneNumController.text.isNotEmpty) {
                    setState(() {
                      points = int.parse(pointsController.text);

                      userController()
                          .addPoints(phoneNumController.text, points!);

                      Future<users?> updatedUser = databaseHelper()
                          .getMemberByPhoneNum(phoneNumController.text);
                    });
                  }
                },
                child: Text("Add Points")),
            Text(user.points.toString())
          ]),
        ),
      ),
    );
  }
}

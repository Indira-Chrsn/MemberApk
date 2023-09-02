import 'package:flutter/material.dart';
import 'package:member_apps/components/addPoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/controllers/user_controller.dart';

class PointsPage extends StatefulWidget {
  // const PointsPage({super.key});

  @override
  PointsState createState() => PointsState();
}

class PointsState extends State<PointsPage> {
  final phoneNumController = TextEditingController();
  final pointsController = TextEditingController();
  int? points;
  users? user;
  int pointState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20.0, left: 8.0),
          width: 350,
          height: 450,
          decoration: BoxDecoration(
              color: Color(0xFFEDF4F6),
              borderRadius: BorderRadius.circular(15)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Add points",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // phone num / email
                  MyAddPoints(
                      controller: phoneNumController,
                      hintText: "Enter phone number"),

                  SizedBox(
                    height: 10,
                  ),

                  // amount of points
                  MyAddPoints(
                    controller: pointsController,
                    hintText: "Enter amount of points",
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // add button
                  ElevatedButton(
                    onPressed: () async {
                      if (phoneNumController.text.isNotEmpty) {
                        points = int.parse(pointsController.text);

                        userController()
                            .addPoints(phoneNumController.text, points!);

                        user = await databaseHelper()
                            .getMemberByPhoneNum(phoneNumController.text);

                        setState(() {
                          user = user;
                          pointState = user!.points + int.parse(pointsController.text);
                        });

                        if (user == null) {
                          print("user is null");
                        }

                        print(user);
                      }
                    },
                    child: Text("Add Points"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF4EBECD),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            // Show user data
            Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (user != null) ...[
                      Text('${user?.username}'),
                      Text('${user?.phoneNumber}'),
                      Text('points: $pointState'),

                      SizedBox(
                        height: 15,
                      ),

                      // points successfully added
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                              color: Colors.green),
                          child: Text(
                            "Points successfully added!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      )
                    ]
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}

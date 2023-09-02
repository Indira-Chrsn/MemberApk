import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/pages/admin_Homepage.dart';
import 'package:member_apps/pages/homepage.dart';
import 'package:member_apps/pages/index.dart';
import 'package:member_apps/pages/register_page.dart';
import 'package:member_apps/controllers/user_controller.dart';
import 'package:member_apps/pages/testPage.dart';
import 'package:member_apps/pages/PointsPage.dart';

import '_homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // LoginStatee({super.key});

  // text editing controller
  final dataController = TextEditingController();
  final passwordController = TextEditingController();

  // for sharedPreferences matter
  bool isLoggedIn = false;
  bool loginUser = false;
  String userStatus = '';

// initializing SharedPreferences object
// used to save and pass user credential through the screens. Applied for persistent login
  late SharedPreferences sharedPreferences;

/* 
  initiating state. what is done here:
    - get the saved user data (if user has logged in and not signed out) using initGetSavedData()
    - calling check_if_logged_in() method to check wether the user is still logged in
      (user data in sharedPreferences not removed yet)
*/
  @override
  void initState() {
    super.initState();
    initGetSavedData();
    check_if_logged_in();
  }

  void initGetSavedData() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

/*
  login method. what is done here?
    - check if user has been registered by calling databaseHelper's getLoginUser() method
    - if user is registered (not null), then proceed the login proccess, such as:
      + set isLoggedIn to true, because if all credential data is verified, user will be logged in
      + save credential data to SharedPreferences object so we can use it in other screen
      + check user's status, if status is member, then redirect to member's homepage. Admin's homepage if otherwise
    - if user is not registered (null), then show snackbar (user not found)
*/
  void loggingIn() async {
    final user = await databaseHelper()
        .getLoginUser(dataController.text, passwordController.text);

    sharedPreferences = await SharedPreferences.getInstance();
    if (user != null) {
      isLoggedIn = true;
      sharedPreferences.setString('username', user.username);
      sharedPreferences.setString('email', user.email);
      sharedPreferences.setString('phoneNumber', user.phoneNumber);
      sharedPreferences.setInt('points', user.points);
      sharedPreferences.setBool('isLoggedIn', isLoggedIn);
      sharedPreferences.setString('userStatus', user.userStatus);
      userStatus = user.userStatus;

      if (user.userStatus == "member") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Homepage(
                    // user: user,
                    )));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => admin_Homepage()));
      }
      // directing user to homepage if user is not null
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found.')));
    }
  }

/* 
  check if the user has logged in
  (this method is run before all the methods in this page is run nor widget is built,
  therefore, the user will automatically directed to homepage (don't have to log in again))
    - getInstance() to get saved user data
    - check if theres a logged in user
    - if there is, then redirect to homepage
*/
  void check_if_logged_in() async {
    sharedPreferences = await SharedPreferences.getInstance();

    loginUser = (sharedPreferences.getBool('isLoggedIn') ?? false);

    if (loginUser) {
      if (userStatus == "member") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => admin_Homepage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // welcome back
                  Text(
                    "Welcome back, you\'ve been missed!",
                    style: TextStyle(
                        color: Color.fromARGB(255, 153, 153, 153),
                        fontSize: 16),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // uname textfield
                  MyTextField(
                    controller: dataController,
                    hintText: 'email / phone number',
                    obscureText: false,
                    validatorText: "This field",
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    validatorText: "Password",
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        loggingIn();
                        // final user = await databaseHelper().getLoginUser(
                        //     dataController.text, passwordController.text);

                        // if (user != null) {
                        //   // final userdata = user.toJson();
                        //   String userdata = jsonEncode(user);
                        //   sharedPreferences.setString('userdata', userdata);

                        //   // directing user to homepage if user is not null
                        //   if (user.userStatus == "member") {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => Homepage(
                        //                   user: user,
                        //                 )));
                        //   } else {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => admin_Homepage()));
                        //   }
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //           content:
                        //               Text('Data pengguna tidak ditemukan')));
                        // }

                        // Future<users?> loginUser = databaseHelper()
                        //     .getLoginUser(
                        //         dataController.text, passwordController.text)
                        //     .then((UserData) {
                        //   Navigator.pushAndRemoveUntil(
                        //       context,
                        //       MaterialPageRoute(builder: (_) => homePage()),
                        //       (Route<dynamic> route) => false);
                        // });

                        // if (loginUser != null) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => homePage()));
                        // }
                        // if (_formKey.currentState!.validate()) {
                        //   Navigator.push(context,
                        //       MaterialPageRoute(builder: (context) => index()));
                        // }
                      },
                      child: Text('Masuk')),

                  // forgot password

                  // signin button

                  // or continue with

                  // google sign in button

                  // register
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.greenAccent),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text("Daftar"),
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        userController().userRegistered(
                            "admin1",
                            "admin1@test.com",
                            "admin1",
                            "9090",
                            1024524096,
                            "admin");
                        // if (await check) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('check = true')));
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(content: Text('check = false')));
                        // }
                      },
                      child: Text('Test Register')),
                ],
              ),
            ),
          )),
    );
  }
}

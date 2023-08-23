import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/pages/homepage.dart';
import 'package:member_apps/pages/index.dart';
import 'package:member_apps/pages/register_page.dart';
import 'package:member_apps/controllers/user_controller.dart';
import 'package:member_apps/pages/testPage.dart';
import 'package:member_apps/pages/PointsPage.dart';

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
                        final user = await databaseHelper().getLoginUser(
                            dataController.text, passwordController.text);
                        
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PointsPage(
                                  user: user,
                                )));
                        } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data pengguna tidak ditemukan')));
                        }

                        
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
                        userController().userRegistered("Ayaa", "ayaa@test.com",
                            "aya1", "08111", 1024524096, "member");
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

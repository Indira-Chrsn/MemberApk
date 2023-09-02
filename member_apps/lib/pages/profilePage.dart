import 'package:flutter/material.dart';
import 'package:member_apps/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String username = '';
  String email = '';
  String phoneNum = '';
  int points = 0;
  bool isLoggedIn = false;

  late SharedPreferences prefs;

  void loadUserData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      email = prefs.getString('email') ?? '';
      phoneNum = prefs.getString('phoneNumber') ?? '';
      points = prefs.getInt('points') ?? 0;
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
    print(
        'User data loaded: username=$username, email=$email, isLoggedIn=$isLoggedIn');
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void logout() {
    prefs.clear();
    // prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));

    print('Navigating to LoginPage');
    print(
        'User data loaded: username=$username, email=$email, isLoggedIn=$isLoggedIn');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            logout();
          },
        ),
      )),
    );
  }
}

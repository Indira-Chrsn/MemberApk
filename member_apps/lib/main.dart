import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:member_apps/pages/admin_Homepage.dart';
import 'package:member_apps/pages/admin_ManageStore.dart';
import 'pages/login_page.dart';
import 'pages/testPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Member Apk',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: LoginPage(),
    );
  }
}

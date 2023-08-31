import 'package:flutter/material.dart';


class admin_Homepage extends StatefulWidget {
  const admin_Homepage({super.key});

  @override
  State<admin_Homepage> createState() => _admin_HomepageState();
}

class _admin_HomepageState extends State<admin_Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("Welcome to admin homepage"),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';

class homePage extends StatefulWidget {
  // const homePage({super.key});

  users user;
  homePage({super.key, required this.user});

  @override
  homePageState createState() => homePageState(user);
}

class homePageState extends State<homePage> {
  final _formKey = GlobalKey<FormState>();

  users user;
  homePageState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(user.username),
            ],
          ),
        ),
      ),
    );
  }
}

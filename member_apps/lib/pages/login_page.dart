import 'package:flutter/material.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/pages/index.dart';
import 'package:member_apps/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
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
                    color: Color.fromARGB(255, 153, 153, 153), fontSize: 16),
              ),

              const SizedBox(
                height: 25,
              ),

              // uname textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(
                height: 25,
              ),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 25,
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => index()));
                  },
                  child: Text('Masuk')
              ),

              // forgot password

              // signin button

              // or continue with

              // google sign in button

              // register
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.greenAccent),
                ),
                onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text("Daftar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

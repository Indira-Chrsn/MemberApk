import 'package:flutter/material.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/components/dateOfBirth.dart';
import 'package:member_apps/pages/login_page.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            Text(
              "Daftar Disini",
              style: TextStyle(
                color: Colors.black12,
                fontSize: 24,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // Username
            MyTextField(
                controller: usernameController,
                hintText: "Masukkan username",
                obscureText: false),

            const SizedBox(
              height: 25,
            ),

            // email
            MyTextField(
                controller: emailController,
                hintText: "Masukkan email",
                obscureText: false),

            const SizedBox(
              height: 25,
            ),

            // phone number
            MyTextField(
                controller: phoneNumController,
                hintText: "Masukkan nomor telepon",
                obscureText: false),

            const SizedBox(
              height: 25,
            ),

            // password
            MyTextField(
                controller: passwordController,
                hintText: "Masukkan password",
                obscureText: true),

            const SizedBox(
              height: 25,
            ),

            // confirm password
            MyTextField(
                controller: confirmPasswordController,
                hintText: "Konfirmasi password",
                obscureText: true),

            const SizedBox(
              height: 25,
            ),

            // Datepicker for date of birth
            birthDate(),

            const SizedBox(
              height: 25,
            ),

            // Submit register button
            ElevatedButton(onPressed: () {}, child: Text("Daftar")),

            const SizedBox(
              height: 25,
            ),

            // Back button (debugging purpose)
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text("Kembali")
            ),
          ],
        ),
      )),
    );
  }
}

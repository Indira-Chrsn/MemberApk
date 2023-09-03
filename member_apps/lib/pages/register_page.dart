import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/components/textfield.dart';
import 'package:member_apps/components/dateOfBirth.dart';
import 'package:member_apps/pages/login_page.dart';
import 'package:member_apps/controllers/user_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumController = TextEditingController();
  int? selectedDOB;

  void _onRegisterButtonPressed() async {
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String phoneNumber = phoneNumController.text;
    int? dateOfBirth = selectedDOB;

    databaseHelper dbHelper = databaseHelper();
    users newUser = users(
      username: username,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      userStatus: "member",
      points: 0,
    );

/*
    if (password == confirmPassword) {
      dbHelper.registerUser(newUser);
    } else {
      return;
    }

    final checkRegistered = userRegistered(
                            usernameController.text,
                            emailController.text,
                            passwordController.text,
                            phoneNumController.text,
                            selectedDOB,
                            "member"); */
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Nama wajib diisi';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Email wajib diisi';
              }
            },
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Password wajib diisi';
              }
              // Anda dapat menambahkan validasi lainnya untuk password di sini
              return null;
            },
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Konfirmasi Password', // Kolom konfirmasi password
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Konfirmasi Password wajib diisi';
              } else if (value != password) {
                return 'Konfirmasi Password tidak sesuai dengan Password';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                confirmPassword = value;
              });
            },
          ),
          SizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
              }
            },
            child: Text('Daftar'),
          ),
        ],
      ),
    );
  }
}

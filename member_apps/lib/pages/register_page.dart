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
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                  obscureText: false,
                  validatorText: "username",
                ),

                const SizedBox(
                  height: 25,
                ),

                // email
                MyTextField(
                  controller: emailController,
                  hintText: "Masukkan email",
                  obscureText: false,
                  validatorText: "Email",
                ),

                const SizedBox(
                  height: 25,
                ),

                // phone number
                MyTextField(
                  controller: phoneNumController,
                  hintText: "Masukkan nomor telepon",
                  obscureText: false,
                  validatorText: "Nomor telepon",
                ),

                const SizedBox(
                  height: 25,
                ),

                // password
                MyTextField(
                  controller: passwordController,
                  hintText: "Masukkan password",
                  obscureText: true,
                  validatorText: "Password",
                ),

                const SizedBox(
                  height: 25,
                ),

                // confirm password
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Konfirmasi password",
                  obscureText: true,
                  validatorText: "Konfirmasi password",
                ),

                const SizedBox(
                  height: 25,
                ),

                // Datepicker for date of birth
                // birthDate(),
                TextFormField(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      selectedDOB = pickedDate.millisecondsSinceEpoch ~/ 1000;
                    }
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // Submit register button
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (passwordController.text !=
                            confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Konfirmasi kata sandi tidak sesuai')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data anda akan diproses')));

                          var check = userRegistered(
                              usernameController.text,
                              emailController.text,
                              passwordController.text,
                              phoneNumController.text,
                              selectedDOB,
                              "member");

                          if (check == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('data null')));
                          } else {
                            print(check);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(content: Text('data not null')));
                          }
                        }
                      }
                    },
                    child: Text("Daftar")),

                const SizedBox(
                  height: 25,
                ),

                // Back button (debugging purpose)
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text("Kembali")),
              ],
            ),
          ))),
    );
  }
}

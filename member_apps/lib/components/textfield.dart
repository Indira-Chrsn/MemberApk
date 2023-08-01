import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final String validatorText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.validatorText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        /*
        Validator to check whether the form is empty or not. if empty, then
        return "<field> tidak boleh kosong!", else, return nothing. the return
        value will be shown using snackbar (check the buttons in register and login page)
        */
        validator: (value) =>
          value!.isEmpty ? validatorText+" tidak boleh kosong!" : null,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            fillColor: Color.fromARGB(224, 236, 236, 245),
            filled: true,
            hintText: hintText),
      ),
    );
  }
}

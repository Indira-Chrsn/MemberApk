import 'package:flutter/material.dart';

class MyAddPoints extends StatelessWidget {
  final controller;
  final String hintText;

  const MyAddPoints({super.key, this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      width: 300,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xFFB0E1E8)),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        obscureText: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFF4EBECD),)),
      ),
    );
  }
}

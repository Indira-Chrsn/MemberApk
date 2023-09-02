import 'package:flutter/material.dart';


class ManageBanner extends StatelessWidget {
  const ManageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("This is a page to manage store's banner")),
    );
  }
}
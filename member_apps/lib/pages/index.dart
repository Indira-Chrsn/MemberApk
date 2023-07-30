import 'package:flutter/material.dart';
import 'package:member_apps/pages/login_page.dart';

class index extends StatelessWidget {
  index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(children: [

            const SizedBox(
              height: 75,
            ),

            Text('Welcome to index page'),

            const SizedBox(
              height: 75,
            ),

            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Logout')
            ),

          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/Services/databaseHelper.dart';
import 'package:member_apps/pages/login_page.dart';

class index extends StatefulWidget {
  @override
  indexState createState() => indexState();
}

class indexState extends State<index> {
  bool isDatabaseConnected = false;

  @override
  void initState() {
    super.initState();
    _checkDatabaseConnection();
  }

  Future<void> _checkDatabaseConnection() async {
    final dbHelper = databaseHelper();
    final connected = await dbHelper.isDatabaseConnected();
    setState(() {
      isDatabaseConnected = connected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Database Connection Status"),
        ),
        body: Center(
            child: isDatabaseConnected
                ? Text('Database Connected!')
                : Text("Database Connection Failed.")),
      ),
    );
  }
}

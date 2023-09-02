import 'package:flutter/material.dart';
import 'package:member_apps/pages/admin_ManageStore.dart';
import 'package:member_apps/pages/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class admin_Homepage extends StatefulWidget {
  const admin_Homepage({super.key});

  @override
  State<admin_Homepage> createState() => _adminHomepageState();
}

class _adminHomepageState extends State<admin_Homepage> {
  String username = '';
  String email = '';
  String phoneNum = '';
  int points = 0;
  bool isLoggedIn = false;

  void loadUserdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      email = prefs.getString('email') ?? '';
      phoneNum = prefs.getString('phoneNumber') ?? '';
      points = prefs.getInt('points') ?? 0;
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // profile icon
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Icon(
                            Icons.logo_dev,
                            size: 30,
                          ),
                        ),
                        Text(
                          "Hi, Dewatacomm",
                          style: TextStyle(fontSize: 28),
                        )
                      ],
                    ),
                    Icon(
                      Icons.help,
                      size: 25,
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 15,
              ),

              // Member count boc
              Container(
                width: 300,
                height: 145,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Color(0xFFDDF5F3)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Member Counts",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "85",
                      style: TextStyle(fontSize: 36),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 50,
              ),

              // any content
              Column(
                children: [
                  Text(
                    "Content Coming Soon",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    height: 200,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: Image.asset('lib/images/comingSoon.png'),
                  ),

                  SizedBox(
                    height: 50,
                  ),

                  // Manage store button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4, shadowColor: Colors.blueGrey),
                    onPressed: () {},
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ManageStorePage()));
                      },
                      child: Container(
                        child: Row(
                          children: [
                            // icon
                            Container(
                              // padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 80,
                              child: Icon(
                                Icons.store,
                                size: 50,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),

                            // Text
                            Text(
                              "Manage your store",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            // arrow
                            Icon(
                              Icons.arrow_forward_outlined,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 239, 234, 234),
        child: Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // home button
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Color(0xC436B2C3),
                ),
              ),

              // profile button
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyProfilePage()));
                  },
                  icon: Icon(
                    Icons.person,
                    size: 32,
                    color: Color(0xC436B2C3),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

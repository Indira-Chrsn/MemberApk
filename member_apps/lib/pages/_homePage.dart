import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:member_apps/pages/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/user_model.dart';
import '../components/catalogIcons.dart';
import '../components/my_points.dart';

class Homepage extends StatefulWidget {
  users user;
  Homepage({super.key, required this.user});

  @override
  HomepageState createState() => HomepageState(user);
}

class HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final String laptopURL =
      'https://www.tokopedia.com/dewatacomm/etalase/notebook';
  final String handphoneURL =
      'https://www.tokopedia.com/dewatacomm/etalase/handphone';
  final String accessoriesURL =
      'https://www.tokopedia.com/dewatacomm/etalase/asesoris-hp';

  users user;
  HomepageState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        // appBar: AppBar(
        //   actions: [
        //     IconButton(onPressed: () {},
        //     icon: Icon(Icons.person))
        //   ],
        //   title: Text('Hi, ${user.username}'),),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Hi, user & icon
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                        Text(
                          " Hi, ${user.username}",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ]),
                      Icon(
                        Icons.help,
                        size: 25,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15),

                // Points box
                Container(
                  width: 300,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Points",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "${user.points}",
                        style: TextStyle(fontSize: 36),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Valid Until "),
                            Text(
                              "31/12/2023",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                    ],
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                // product catalog
                Text(
                  "Our Products",
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                  height: 120,
                  // padding: EdgeInsets.only(left: 40, right: 40),
                  child:
                      // icons
                      ListView(
                    scrollDirection: Axis.horizontal,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyCatalogIcons(
                          url: laptopURL,
                          icon: Icon(Icons.laptop),
                          label: "Laptop"),
                      MyCatalogIcons(
                          url: handphoneURL,
                          icon: Icon(Icons.phone),
                          label: "Handphone"),
                      MyCatalogIcons(
                          url: accessoriesURL,
                          icon: Icon(Icons.headphones),
                          label: "Acessories"),
                      MyCatalogIcons(
                          url: accessoriesURL,
                          icon: Icon(Icons.monitor),
                          label: "Monitor"),
                      MyCatalogIcons(
                          url: accessoriesURL,
                          icon: Icon(Icons.wifi),
                          label: "Wi-Fi"),
                    ],
                  ),
                ),

                SizedBox(
                  height: 35,
                ),

                // Promo banners
                Column(children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: AnotherCarousel(images: [
                      Image.asset(
                        'lib/images/comingSoon.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'lib/images/comingSoon.png',
                        fit: BoxFit.fill,
                      ),
                      Image.asset(
                        'lib/images/comingSoon.png',
                        fit: BoxFit.fill,
                      )
                    ]),
                  )
                ]),
              ],
            ),
          ),
        ),
        // Bottom navigation bar
        bottomNavigationBar: (BottomAppBar(
          color: Colors.orange,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      size: 32,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.blue,
                    )),
              ],
            ),
          ),
        )));
  }
}

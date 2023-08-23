import 'package:flutter/material.dart';
import 'package:member_apps/Models/user_model.dart';
import 'package:member_apps/pages/login_page.dart';
import 'package:member_apps/Services/databaseHelper.dart';

class loginPage extends StatefulWidget {
  const loginPage(users user, {super.key});

  @override
  loginState createState() => loginState();
}

class loginState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  // LoginStatee({super.key});

  // text editing controller
  final dataController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                    width: 360,
                    height: 800,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Stack(children: [
                      Positioned(
                        left: 103,
                        top: 304,
                        child: Container(
                          width: 153,
                          height: 192,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 73,
                                top: 85,
                                child: Container(
                                  width: 80,
                                  height: 107,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/80x107"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 73,
                                top: 50,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/80x80"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 73,
                                top: 0,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/80x80"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 73,
                                top: 85,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(3.14),
                                  child: Container(
                                    width: 73,
                                    height: 107,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://via.placeholder.com/73x107"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 43,
                                top: 154,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(children: []),
                                ),
                              ),
                              Positioned(
                                left: 73,
                                top: 50,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(3.14),
                                  child: Container(
                                    width: 73,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://via.placeholder.com/73x80"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 73,
                                top: 0,
                                child: Transform(
                                  transform: Matrix4.identity()
                                    ..translate(0.0, 0.0)
                                    ..rotateZ(3.14),
                                  child: Container(
                                    width: 73,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            "https://via.placeholder.com/73x80"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 571,
                        child: Container(
                          width: 263,
                          height: 42,
                          decoration: ShapeDecoration(
                            color: Color(0xFF4EBECD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 48,
                        top: 625,
                        child: Container(
                          width: 263,
                          height: 42,
                          decoration: ShapeDecoration(
                            color: Color(0x8265C4D1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 139,
                        top: 577,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueAccent),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              fixedSize:
                                  MaterialStateProperty.all(Size(81, 30))),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Roboto Slab',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ])),
                Positioned(
                  left: 89,
                  top: 754,
                  child: SizedBox(
                    width: 78,
                    height: 17,
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: Color(0xFF4EBECD),
                        fontSize: 12,
                        fontFamily: 'Roboto Slab',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 186,
                  top: 754,
                  child: SizedBox(
                    width: 84,
                    height: 17,
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF4EBECD),
                        fontSize: 12,
                        fontFamily: 'Roboto Slab',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 110,
                  top: 631,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        fixedSize: MaterialStateProperty.all(Size(140, 30))),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text(
                      'Daftar Disini',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Roboto Slab',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // width: 140,
                    // height: 30,
                  ),
                ),
                Positioned(
                  left: 167,
                  top: -78,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(3.14),
                    child: Container(
                      width: 216,
                      height: 224,
                      decoration: ShapeDecoration(
                        color: Color(0x75B3E2E9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 144,
                  top: -55,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(3.14),
                    child: Container(
                      width: 170,
                      height: 178,
                      decoration: ShapeDecoration(
                        color: Color(0x75B3E2E9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 83,
                  top: 69,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(3.14),
                    child: Container(
                      width: 138,
                      height: 136,
                      decoration: ShapeDecoration(
                        color: Color(0x75B3E2E9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 68,
                  top: 83,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..translate(0.0, 0.0)
                      ..rotateZ(3.14),
                    child: Container(
                      width: 108,
                      height: 108,
                      decoration: ShapeDecoration(
                        color: Color(0x75B3E2E9),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }
}

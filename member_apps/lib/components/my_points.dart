import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class MyPromoBanner extends StatefulWidget {
  const MyPromoBanner({super.key});

  @override
  _MyPromoBannerState createState() => _MyPromoBannerState();
}

class _MyPromoBannerState extends State<MyPromoBanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: AnotherCarousel(images: const [
              AssetImage('member_apps\lib\images\telkom.png'),
              AssetImage('member_apps\lib\images\DSC03557.JPG'),
              AssetImage('member_apps\lib\images\IMG_7763.JPG')
            ],),),
          
        ],
      ),
    );
  }
}
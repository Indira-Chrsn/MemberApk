import 'dart:html';

import 'package:flutter/material.dart';

class Welcome_page extends StatelessWidget {
  const Welcome_page({super.key});

  @override
  Widget build(BuildContext context){
    var container = Container();
    return Scaffold(
      body: Stack(children: [
        Image.asset('lib/images/loadpage.png'),
        Container(
          child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 228,)
              Image.asset('lib/images/logo.png', height: 49),
              const SizedBox(
                height: 155,
              ),
              RichText(
                textAlign: TextAlign.center, 
                text: TextSpan(
                  text: 'DEWATACOMM',
                  style: TextStyle(color: Colors.white, fontFamily: 'RobotoMono', fontSize: 24),
                )
              ),
              const SizedBox(
                height: 24,
              ),
              RichText(textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec interdum dolor. Morbi non enim ligula. Phasellus eu iaculis tellus, ut vestibulum velit. Duis a turpis a mauris iaculis suscipit. Nunc aliquam tellus et tellus lacinia bibendum. Sed et convallis metus.',
                    style: TextStyle(color: Colors.white, fontFamily: 'RobotoMono', fontSize: 14),
                  ),
              ),
              const SizedBox(
                height: 87,
              ),
              RichText(
                textAlign: TextAlign.center, 
                text: TextSpan(
                  text: 'NEXT',
                  style: TextStyle(color: Colors.cyan, fontFamily: 'RobotoMono', fontSize: 40),
                ))
            ]
          )
        )),
      ],
    ));
  }
}

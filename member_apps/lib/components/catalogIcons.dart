import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCatalogIcons extends StatelessWidget {
  final String url;
  final Icon icon;
  final String label;

  const MyCatalogIcons(
      {super.key, required this.url, required this.icon, required this.label});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
                onTap: () {
                  _launchURL(url);
                },
                child: icon),
          ),
    
          SizedBox(
            height: 10,
          ),
    
          // label
          Text(label),
        ],
      ),

      SizedBox(width: 20,)
      ],
    );
  }
}

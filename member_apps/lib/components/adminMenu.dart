import 'package:flutter/material.dart';
import '../pages/admin_ManageBanner.dart';
import '../pages/admin_ManageCatalogue.dart';
import '../pages/PointsPage.dart';
import '../pages/index.dart';

class MyAdminMenu extends StatelessWidget {
  const MyAdminMenu(
      {super.key,
      required this.icon,
      required this.label,
      required this.sublabel,
      required this.ScreenType});
  final Icon icon;
  final String label;
  final String sublabel;
  final Type ScreenType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => _buildScreen(context)));
      },
      child: Row(
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: icon,
          ),
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.grey[100]),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    sublabel,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    if (ScreenType == ManageBanner) {
      return ManageBanner();
    } else if (ScreenType == ManageCatalogue) {
      return ManageCatalogue();
    } else if (ScreenType == PointsPage) {
      return PointsPage();
    } else if (ScreenType == index) {
      return index();
    } else {
      return Container();
    }
  }
}

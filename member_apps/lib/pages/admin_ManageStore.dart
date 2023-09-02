import 'package:flutter/material.dart';
import 'package:member_apps/components/adminMenu.dart';
import 'package:member_apps/pages/PointsPage.dart';
import 'package:member_apps/pages/admin_ManageBanner.dart';
import 'package:member_apps/pages/admin_ManageCatalogue.dart';
import 'package:member_apps/pages/index.dart';

class ManageStorePage extends StatelessWidget {
  const ManageStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        decoration: BoxDecoration(color: Colors.black87),
        child: Column(
          children: [
            MyAdminMenu(
                ScreenType: ManageBanner,
                icon: Icon(Icons.discount),
                label: "Manage Banner",
                sublabel: "Let your members know what's new through a informative banner."),

            MyAdminMenu(
                ScreenType: ManageCatalogue,
                icon: Icon(Icons.shopping_bag),
                label: "Manage Catalogue",
                sublabel: "Manage catalogue link to redirect user to your online store."),

            MyAdminMenu(
                ScreenType: ManageBanner,
                icon: Icon(Icons.card_membership),
                label: "Add New Member",
                sublabel: "New family member? That's amazing! sign them up here!"),

            MyAdminMenu(
                ScreenType: PointsPage,
                icon: Icon(Icons.star),
                label: "Add Member's Points",
                sublabel: "Let's appreciate their loyality towards your store!"),

            MyAdminMenu(
                ScreenType: index,
                icon: Icon(Icons.star),
                label: "Index",
                sublabel: ""),
          ],
        ),
      )),
    );
  }
}

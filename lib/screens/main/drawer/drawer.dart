import 'package:flutter/material.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/screens/main/drawer/contact_icons.dart';
import 'package:kratosgado/screens/main/drawer/knowledge.dart';
import 'package:kratosgado/screens/main/drawer/my_skills.dart';
import 'package:kratosgado/screens/main/drawer/personal_info.dart';

import 'about.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              color: bgColor,
              child: const Padding(padding: EdgeInsets.all(defaultPadding/2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PersonalInfo(),
                  ContactIcons(),
                  MySkills(),
                  Knowledge(),
                  Divider(),
                  SizedBox(height: defaultPadding ,),
                ],
              ),),
            )
          ],
        ),
      ),
    );
  }
}

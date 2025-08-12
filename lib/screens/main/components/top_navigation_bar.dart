import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kratosgado/resources/asset.images.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/resources/profile.dart';
import 'package:kratosgado/screens/components/custom.button.dart';
import 'package:kratosgado/resources/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child:
                !Responsive.isLargeMobile(context) ? const CircleAvatar(backgroundImage:  AssetImage(Assets.favicon,)) : const SizedBox(),
          ),
          const Spacer(
            flex: 2
          ),
          if (!Responsive.isLargeMobile(context)) const NavigationButtonList(),
            const Spacer(
              flex: 2
            ),
             CustomButton(text: 'Whatsapp',icon: FontAwesomeIcons.whatsapp, onTap: ()=> launchUrl(Uri.parse('https://wa.me/${Profile.phone}'))),
            const Spacer(),
        ],
      ),
    );
  }
}

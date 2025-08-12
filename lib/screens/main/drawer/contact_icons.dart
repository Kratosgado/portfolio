import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kratosgado/resources/asset.images.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactIcons extends StatelessWidget {
  const ContactIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://www.linkedin.com/in/kratosgado'));
              },
              icon: SvgPicture.asset(Assets.linkedin)),
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/Kratosgado'));
              },
              icon: SvgPicture.asset(Assets.github)),
          const Spacer(),
        ],
      ),
    );
  }
}

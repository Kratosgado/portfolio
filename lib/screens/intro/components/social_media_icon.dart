import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/resources/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  const SocialMediaIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(
            Uri.parse(myProfile.github),
          ),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding * 0.4),
        child: SvgPicture.asset(
          icon,
          height: 15,
          width: 15,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kratosgado/resources/asset.images.dart';
import 'package:url_launcher/url_launcher.dart';

import 'social_media_icon.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          icon: Assets.linkedin,
          onTap: () => launchUrl(

            Uri.parse('https://www.linkedin.com/in/kratosgado'),
          ),
        ),
        SocialMediaIcon(
          icon: Assets.github,
          onTap: () => launchUrl(
            Uri.parse('https://github.com/Kratosgado'),
          ),
        ),
        const SocialMediaIcon(
          icon: Assets.dribble,
        ),
        const SocialMediaIcon(icon: Assets.twitter),
        const SocialMediaIcon(icon: Assets.linkedin),
      ],
    );
  }
}

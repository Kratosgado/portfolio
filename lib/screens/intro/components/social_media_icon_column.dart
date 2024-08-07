import 'package:flutter/material.dart';
import 'package:mbeah_online/resources/network.images.dart';
import 'package:url_launcher/url_launcher.dart';

import 'social_media_icon.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          icon: NetworkImages.linkedin,
          onTap: () => launchUrl(
            
            Uri.parse('https://www.linkedin.com/in/kratosgado'),
          ),
        ),
        SocialMediaIcon(
          icon: NetworkImages.github,
          onTap: () => launchUrl(
            Uri.parse('https://github.com/Kratosgado'),
          ),
        ),
        const SocialMediaIcon(
          icon: NetworkImages.dribble,
        ),
        const SocialMediaIcon(icon: NetworkImages.twitter),
        const SocialMediaIcon(icon: NetworkImages.linkedin),
      ],
    );
  }
}

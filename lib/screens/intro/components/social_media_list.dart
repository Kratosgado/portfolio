import 'package:flutter/material.dart';
import 'package:kratosgado/resources/asset.images.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/resources/profile.dart';
import 'package:kratosgado/screens/intro/components/social_media_icon.dart';
import 'package:url_launcher/url_launcher.dart';

import 'social_media_icon_column.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return TweenAnimationBuilder(
        tween: defaultTween,
        duration: const Duration(milliseconds: 200),
        builder: (context, value, child) => Transform.scale(
              scale: value,
              child: Column(
                children: [
                  const Spacer(),
                  RotatedBox(
                    quarterTurns: -3,
                    child: Text(
                      'Follow Me',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: 3,
                    margin: const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(defaultPadding)),
                  ),
SocialMediaIcon(
          icon: Assets.linkedin,
          onTap: () => launchUrl(

            Uri.parse(myProfile.linkedin),
          ),
        ),
        SocialMediaIcon(
          icon: Assets.github,
          onTap: () => launchUrl(
            Uri.parse(myProfile.github),
          ),
        ),
        const SocialMediaIcon(
          icon: Assets.dribble,
        ),
        const SocialMediaIcon(icon: Assets.twitter),
        const SocialMediaIcon(icon: Assets.linkedin),
                  const Spacer(),
                ],
              ),
            ));
  }
}

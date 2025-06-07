import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/screens/intro/components/animated_texts.dart';
import 'package:kratosgado/screens/intro/components/combine_subtitle.dart';
import 'package:kratosgado/screens/intro/components/headline_text.dart';
import 'package:kratosgado/resources/responsive.dart';

import 'animated_description_text.dart';
import 'email.button.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Row(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!Responsive.isDesktop(context))
                SizedBox(
                  height: size.height * 0.06,
                ),
              if (!Responsive.isDesktop(context))
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.23,
                    ),
                    const AnimatedImageContainer(width: 150, height: 200),
                  ],
                ),
              if (!Responsive.isDesktop(context))
                SizedBox(
                  height: size.height * 0.1,
                ),
              const Responsive(
                desktop: HeadLineText(start: 40, end: 50),
                largeMobile: HeadLineText(start: 40, end: 35),
                mobile: HeadLineText(start: 35, end: 30),
                tablet: HeadLineText(start: 50, end: 40),
              ),
              if (kIsWeb && Responsive.isLargeMobile(context))
                Container(
                  height: defaultPadding,
                  color: Colors.transparent,
                ),
              const CombineSubtitleText(),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              const Responsive(
                desktop: AnimatedDescriptionText(start: 14, end: 15),
                largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                mobile: AnimatedDescriptionText(start: 14, end: 12),
                tablet: AnimatedDescriptionText(start: 17, end: 14),
              ),
              const SizedBox(
                height: defaultPadding * 2,
              ),
              const EmailButton(),
            ],
          ),
        ),
        const Spacer(),
        if (Responsive.isDesktop(context))
          const AnimatedImageContainer(
            height: 350,
            width: 300,
          ),
        const Spacer(),
      ],
    );
  }
}

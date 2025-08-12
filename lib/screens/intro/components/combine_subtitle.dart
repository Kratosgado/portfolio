import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:kratosgado/screens/intro/components/animated_subtitle_text.dart';
import 'package:kratosgado/resources/responsive.dart';

class CombineSubtitleText extends StatelessWidget {
  const CombineSubtitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Responsive(
          desktop: AnimatedSubtitleText(start: 30, end: 40, text: "Software "),
          largeMobile: AnimatedSubtitleText(start: 30, end: 25, text: 'Software '),
          mobile: AnimatedSubtitleText(start: 25, end: 20, text: 'Software '),
          tablet: AnimatedSubtitleText(start: 40, end: 30, text: 'Software '),
        ),
        (kIsWeb && Responsive.isLargeMobile(context)
            ? const Responsive(
                desktop:
                    AnimatedSubtitleText(start: 30, end: 40, text: 'Developer ', gradient: true),
                largeMobile:
                    AnimatedSubtitleText(start: 30, end: 25, text: 'Developer ', gradient: true),
                mobile: AnimatedSubtitleText(start: 25, end: 20, text: 'Developer ', gradient: true),
                tablet: AnimatedSubtitleText(start: 40, end: 30, text: 'Developer ', gradient: true),
              )
            : ShaderMask(
                shaderCallback: ((bounds) => const LinearGradient(colors: [
                      Colors.pink,
                      Colors.blue,
                    ]).createShader(bounds)),
                child: const Responsive(
                  desktop:
                      AnimatedSubtitleText(start: 30, end: 40, text: 'Developer ', gradient: false),
                  largeMobile:
                      AnimatedSubtitleText(start: 30, end: 25, text: 'Developer ', gradient: false),
                  mobile:
                      AnimatedSubtitleText(start: 25, end: 20, text: 'Developer ', gradient: true),
                  tablet:
                      AnimatedSubtitleText(start: 40, end: 30, text: 'Developer ', gradient: false),
                ),
              )),
      ],
    );
  }
}

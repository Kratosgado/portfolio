import 'package:flutter/material.dart';
import 'package:kratosgado/resources/asset.images.dart';
import 'package:kratosgado/resources/constants.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skill(title: 'ML/AI', imageUrl: Assets.dart),
        Skill(title: 'Flutter', imageUrl: Assets.flutter),
        Skill(title: 'Dart', imageUrl: Assets.dart),
        Skill(title: 'Firebase', imageUrl: Assets.firebase),
        Skill(title: 'NestJs', imageUrl: Assets.dart),
        Skill(title: 'Prisma', imageUrl: Assets.dart),
        Skill(title: 'TypeOrm', imageUrl: Assets.dart),
        Skill(title: 'Sqlite', imageUrl: Assets.dart),
        Skill(title: 'Responsive Design', imageUrl: Assets.flutter),
        Skill(title: 'Clean Architecture', imageUrl: Assets.flutter),
      ],
    );
  }
}

class Skill extends StatelessWidget {
  final String title;
  final String? imageUrl;
  const Skill({super.key, required this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imageUrl!,
                  height: 15,
                  width: 15,
                  fit: BoxFit.cover,
                ),
                const SizedBox( width: 5),
                Text( title, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
    );
  }
}

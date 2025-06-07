import 'package:flutter/material.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/resources/network.images.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skill(title: 'ML/AI', imageUrl: NetworkImages.dart),
        Skill(title: 'Flutter', imageUrl: NetworkImages.flutter),
        Skill(title: 'Dart', imageUrl: NetworkImages.dart),
        Skill(title: 'Firebase', imageUrl: NetworkImages.firebase),
        Skill(title: 'NestJs', imageUrl: NetworkImages.dart),
        Skill(title: 'Prisma', imageUrl: NetworkImages.dart),
        Skill(title: 'TypeOrm', imageUrl: NetworkImages.dart),
        Skill(title: 'Sqlite', imageUrl: NetworkImages.dart),
        Skill(title: 'Responsive Design', imageUrl: NetworkImages.flutter),
        Skill(title: 'Clean Architecture', imageUrl: NetworkImages.flutter),
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
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 1),
        builder: (context, value, child) => Column(
          children: [
            Row(
              children: [
                Image.network(
                  imageUrl!,
                  height: 15,
                  width: 15,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                // Text('${(value * 100).toInt()}%'),
              ],
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.black,
              color: Colors.amberAccent,
            )
          ],
        ),
      ),
    );
  }
}

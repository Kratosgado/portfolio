import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kratosgado/resources/asset.images.dart';

import '../../../resources/constants.dart';


class Knowledge extends StatelessWidget {
  const Knowledge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Knowledge + Relevant courses',style: TextStyle(color: Colors.white),),
        ),
        KnowledgeText(knowledge: "modern C++"),
        KnowledgeText(knowledge: "Backend Development"),
        KnowledgeText(knowledge: "Database management"),
        KnowledgeText(knowledge: 'Flutter, Dart'),
        KnowledgeText(knowledge: 'Machine Learning/ AI'),
        KnowledgeText(knowledge: 'Git, Github'),
      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({super.key, required this.knowledge});
  final String knowledge;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/2),
      child: Row(
        children: [
          SvgPicture.asset(Assets.check),
          const SizedBox(width: defaultPadding/2,),
          Text(knowledge),
        ],
      ),
    );
  }
}

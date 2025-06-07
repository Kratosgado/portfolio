import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/screens/main/components/navigation_button_list.dart';
import 'package:kratosgado/resources/controller.dart';
import 'package:kratosgado/resources/responsive.dart';

import 'components/top_navigation_bar.dart';
import 'drawer/drawer.dart';

class MainView extends StatelessWidget {
  final List<Widget> pages;

  const MainView({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(
                    height: defaultPadding * 2,
                  )
                : const SizedBox(
                    height: defaultPadding / 2,
                  ),
            const SizedBox(
              height: 80,
              child: TopNavigationBar(),
            ),
            if (Responsive.isLargeMobile(context))
              const Row(
                children: [
                  Spacer(),
                  NavigationButtonList(),
                  Spacer(),
                ],
              ),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [...pages],
              ),
            )
          ],
        ),
      ),
    );
  }
}

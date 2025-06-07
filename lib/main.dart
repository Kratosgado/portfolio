import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kratosgado/resources/constants.dart';
import 'package:kratosgado/screens/splash/splash_view.dart';


void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kratosgado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: Colors.white,)
        .copyWith(
          bodyLarge: const TextStyle(color: bodyTextColor),
          bodyMedium: const TextStyle(color: bodyTextColor),
        )
      ),
      home: const SplashView(),
    );
  }
}

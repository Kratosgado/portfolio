import 'package:flutter/material.dart';
import 'package:kratosgado/resources/constants.dart';

class CustomButton extends StatelessWidget {
	final VoidCallback? onTap;
	final String text;
	final IconData icon;
	const CustomButton({super.key, required this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
				onTap: onTap,
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: Container(
					padding: const EdgeInsets.symmetric(vertical: defaultPadding/1.5 , horizontal: defaultPadding * 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultPadding),
              gradient: LinearGradient(colors: [Colors.pink, Colors.blue.shade900]),
              boxShadow: const [
                BoxShadow(
                    color: Colors.blue, offset: Offset(0, -1), blurRadius: defaultPadding / 4),
                BoxShadow(color: Colors.red, offset: Offset(0, 1), blurRadius: defaultPadding / 4),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Icon(
                icon,
                color: Colors.greenAccent,
                size: 15,
              ),
              const SizedBox(width: defaultPadding / 4),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white, letterSpacing: 1.2, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

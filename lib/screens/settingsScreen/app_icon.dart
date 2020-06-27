import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  static const double size = 32;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: SizedBox(
          width: size * 2,
          height: size * 2,
          child: Image.asset("assets/images/Let's do it icon.png"),
        ),
      ),
    );
  }
}

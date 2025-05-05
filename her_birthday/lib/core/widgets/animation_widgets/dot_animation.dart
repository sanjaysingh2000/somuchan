import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DotAnimation extends StatelessWidget {
  const DotAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 70,
      child: Lottie.asset(
        'assets/images/dott_animation.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}

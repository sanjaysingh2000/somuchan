import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GradientAnimation extends StatelessWidget {
  const GradientAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Lottie.asset(
        'assets/images/gradient_animation.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}

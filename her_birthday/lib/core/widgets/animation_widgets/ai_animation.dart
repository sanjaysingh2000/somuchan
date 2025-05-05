import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AiAnimation extends StatelessWidget {
  const AiAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Lottie.asset(
        'assets/images/AiAnimation.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}

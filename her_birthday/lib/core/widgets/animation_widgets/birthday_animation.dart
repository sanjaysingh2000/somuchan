import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BirthdayAnimation extends StatelessWidget {
  const BirthdayAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Lottie.asset(
        'assets/images/birthday.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}

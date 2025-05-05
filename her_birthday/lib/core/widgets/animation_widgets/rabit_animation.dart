import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RabbitAnimation extends StatelessWidget {
  const RabbitAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 100,
      child: Lottie.asset(
        'assets/images/rabbit.json',
        fit: BoxFit.cover,
        repeat: true,
      ),
    );
  }
}

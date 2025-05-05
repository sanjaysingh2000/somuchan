import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PoppingOut extends StatelessWidget {
  const PoppingOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Lottie.asset(
        'assets/images/poppingout.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}

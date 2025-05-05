import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 70,
      child: Lottie.asset(
        'assets/images/app_loader.json',
        fit: BoxFit.contain,
        repeat: true,
      ),
    );
  }
}

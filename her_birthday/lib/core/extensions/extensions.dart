import 'package:flutter/material.dart';

extension SizedBoxExtension on num {

  SizedBox get h => SizedBox(height: toDouble());

  SizedBox get w => SizedBox(width: toDouble());

  SizedBox wh(double height) => SizedBox(width: toDouble(), height: height);

}

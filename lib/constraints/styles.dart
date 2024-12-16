import 'package:flutter/material.dart';
import 'package:portfolio/utils/appcolors.dart';

class Styles {
  static BoxDecoration gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.darkGreen1,
        Colors.lightGreen.shade400,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );
}

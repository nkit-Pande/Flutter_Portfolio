import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../utils/appcolors.dart';

class GradientTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final Size size;
  const GradientTextWidget({super.key,required this.size,required this.text1,this.text2 = ""});

  @override
  Widget build(BuildContext context) {
    return GradientText(
        "$text1\n$text2",
      colors: const [
        AppColors.ivory,
        Colors.white
      ],
      style: TextStyle(
          fontSize: size.width * 0.04,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.bold
      ),

    );
  }
}

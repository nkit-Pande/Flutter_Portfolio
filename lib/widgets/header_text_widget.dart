import 'package:flutter/material.dart';
import 'package:portfolio/utils/appcolors.dart';
import 'package:portfolio/utils/text.dart';
import 'package:portfolio/widgets/social_section.dart';
import 'package:portfolio/widgets/social_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'download_cv.dart';

class HeaderTextWidget extends StatelessWidget {
  final Size size;
  final bool isMobile;

  const HeaderTextWidget({super.key, required this.size,this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.red),
      // margin: EdgeInsets.symmetric(horizontal:size.width*0.05),
      //symmetric(horizontal:size.width*0.07 ,vertical: size.height*0.15)
      child: Column(
        crossAxisAlignment: !isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Text(
            "Ankit Pande",
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize: !isMobile ?  size.width * 0.030 :  size.width * 0.08,
              color: AppColors.limeGreen3,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins"
            ),
          ),
          GradientText(
              "Mobile Application \nDeveloper",
              colors: const [
                Color(0xFFC9F6B4),
                Color(0xFFFFFFFF),
              ],
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TextStyle(
              fontSize:!isMobile ?  size.width * 0.040 :  size.width * 0.09,
                // size.width * 0.040
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            width: !isMobile ? size.width * 0.5 : size.width * 0.9 ,
            child:Text(
              TextUtil.HEADER_BODY,
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
              style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class SocialLarge extends StatelessWidget {
  final Size size;
  const SocialLarge({super.key,required this.size});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.5,
      child: const Row(
        children: [
          DownloadCv(),
          SizedBox.square(dimension: 12),
          SocialWidget()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/constraints/styles.dart';
import 'package:portfolio/utils/appcolors.dart';
import 'package:portfolio/widgets/custom_tab_bar.dart';
import 'package:portfolio/widgets/gradient_text_widget.dart';
import 'package:portfolio/widgets/my_skills_widget.dart';
import 'package:portfolio/widgets/header_text_widget.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../widgets/rotating_image_container.dart';
import '../../widgets/social_section.dart';

class WebLayoutScreen extends StatefulWidget {
  const WebLayoutScreen({super.key});


  @override
  State<WebLayoutScreen> createState() => _WebLayoutScreenState();

}

class _WebLayoutScreenState extends State<WebLayoutScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical:size.height*0.22,horizontal:size.width*0.05),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: [
                        Row(
                          children: [HeaderTextWidget(size: size),],
                        ),
                        const SizedBox.square(dimension: 20),
                        SocialLarge(size: size),
                      ],
                    ),
                    const SizedBox(width: 150,),
                    const RotatingImageContainer(),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                decoration: const BoxDecoration(
                  color: AppColors.jet,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),),
                child: Column(
                  children: [
                    GradientText("Technical Skills", colors: const [
                      AppColors.limeGreen1,
                      AppColors.limeGreen3,
                ],
                  style: TextStyle(
                      fontSize: size.width * 0.04,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold
                  ),),
                    SizedBox(height: size.height * 0.08,),
                    MySkillsWidget(size: size),

                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                child: Column(

                  children: [
                    GradientText("Recent Work", colors: const [
                      AppColors.ivory,
                      Colors.white,
                    ],
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold
                      ),),
                    CustomTabBar(tabController: _tabController,)
                  ],
                ),
              ),
              Container(
                height: size.height * 1.5,
                child: CustomTabBarView(tabController: _tabController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

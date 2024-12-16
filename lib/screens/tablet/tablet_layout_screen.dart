import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../constraints/styles.dart';
import '../../utils/appcolors.dart';
import '../../widgets/custom_tab_bar.dart';
import '../../widgets/my_skills_widget.dart';
import '../../widgets/download_cv.dart';
import '../../widgets/header_text_widget.dart';
import '../../widgets/rotating_image_container.dart';
import '../../widgets/social_widget.dart';

class TabletLayoutScreen extends StatefulWidget {
  const TabletLayoutScreen({super.key});

  @override
  State<TabletLayoutScreen> createState() => _TabletLayoutScreenState();
}

class _TabletLayoutScreenState extends State<TabletLayoutScreen> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: size.height * 0.15,
              // horizontal: size.width * 0.03
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      children: [
                        Column(
                          children: [
                            HeaderTextWidget(size: size),
                            const SizedBox.square(dimension: 20),
                          ],
                        ),
                        SocialTab(size: size),
                      ],
                    ),
                    SizedBox(width: size.width * 0.15),
                    const RotatingImageContainer(),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                  decoration: const BoxDecoration(
                      color: AppColors.jet,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),),
                  child: Column(
                    children: [
                      GradientText(
                        "Technical Skills",
                        colors: const [AppColors.limeGreen3, Colors.white],
                        style: TextStyle(
                            fontSize: size.width * 0.04,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      MySkillsWidget(
                        size: size,
                        isTab: true,
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
                            CustomTabBar(tabController: _tabController,isTab: true,)
                          ],
                        ),
                      ),
                      Container(
                        height: size.height * 1.5,
                        child: CustomTabBarView(tabController: _tabController,isTab: true),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialTab extends StatelessWidget {
  final Size size;

  const SocialTab({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.45,
      child: const Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DownloadCv(),
          SizedBox(
            width: 50,
            height: 10,
          ),
          SocialWidget()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/screens/mobile/my_skills_widget_mobile.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../constraints/styles.dart';
import '../../utils/appcolors.dart';
import '../../widgets/custom_tab_bar.dart';
import '../../widgets/my_skills_widget.dart';
import '../../widgets/download_cv.dart';
import '../../widgets/header_text_widget.dart';
import '../../widgets/rotating_image_container.dart';
import '../../widgets/social_widget.dart';
import '../tablet/tablet_layout_screen.dart';


class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> with SingleTickerProviderStateMixin {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.15,
                    // horizontal: size.width * 0.03
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RotatingImageContainer(isMobile: true,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Column(
                          children: [
                            Column(
                              children: [
                                HeaderTextWidget(size: size,isMobile: true,),
                                const SizedBox.square(dimension: 20),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                    SocialMob(size: size),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
                      decoration: const BoxDecoration(
                        color: AppColors.jet,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: GradientText("Technical Skills", colors: const [
                              AppColors.limeGreen3,
                              Colors.white
                            ],
                              style: TextStyle(
                                  fontSize: size.width * 0.094,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          SizedBox(height: size.height * 0.08,),
                          MySkillsWidgetMobile(size: size),

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
                          CustomTabBar(tabController: _tabController,isMob: true),
                        ],
                      ),
                    ),
                    Container(
                      // Remove the height constraint here
                      constraints: BoxConstraints(
                        maxHeight: size.height * 0.5, // Set a maximum height
                      ),
                      child: CustomTabBarView(tabController: _tabController,isMob: true),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class SocialMob extends StatelessWidget {
  final Size size;
  const SocialMob({super.key,required this.size});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DownloadCv(),
        SizedBox(width: 50,height: 10,),
        SocialWidget(isTab: true,)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/screens/mobile/mobile_layout_screen.dart';
import 'package:portfolio/screens/tablet/tablet_layout_screen.dart';
import 'package:portfolio/screens/web/web_layout_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
          if(constraints.maxWidth > 950) {
            return const WebLayoutScreen();
          } else if(constraints.maxWidth > 450){
            return const TabletLayoutScreen();
          }else{
            return const MobileLayoutScreen();
          }
        }
    );
  }
}


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/appcolors.dart';

class MySkillsWidgetMobile extends StatefulWidget {
  final Size size;

  const MySkillsWidgetMobile({super.key, required this.size});

  @override
  State<MySkillsWidgetMobile> createState() => _MySkillsWidgetMobileState();
}

class _MySkillsWidgetMobileState extends State<MySkillsWidgetMobile> {
  final List<bool> _isHovered = [false, false, false, false, false];
  final List<String> _skillLabel = [
    "Program Language",
    "Frameworks",
    "Version Control",
    "Development Tools",
    "Database"
  ];
  final List<String> _skillValue = [
    "Java, Kotlin, Javascript",
    "React Native, Jetpack Compose, Flutter",
    "Git",
    "Android Studio, VSCode, Postman, IntelliJ IDEA",
    "MySQL, SQLite"
  ];
  final List<IconData> icons = [
    FontAwesomeIcons.code,
    FontAwesomeIcons.fileCode,
    FontAwesomeIcons.codeCommit,
    FontAwesomeIcons.tools,
    FontAwesomeIcons.database
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: _isHovered.length,
      separatorBuilder: (context, index) => Divider(
        height: 20,
        color: Colors.grey.shade200,
      ),
      itemBuilder: (context, index) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered[index] = true),
          onExit: (_) => setState(() => _isHovered[index] = false),
          child: AnimatedContainer(
            padding: const EdgeInsets.all(5),
            duration: const Duration(microseconds: 300),
            curve: Curves.bounceOut,
            margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.015),
            height: widget.size.height * 0.12,
            width: widget.size.width,
            decoration: BoxDecoration(
                color: _isHovered[index] ? null : Colors.transparent,
                gradient: _isHovered[index]
                    ? const LinearGradient(colors: [
                        AppColors.appleGreen,
                        AppColors.appleGreen,
                      ])
                    : null,
                border: Border.all(
                    width: 0.2,
                    color:
                        _isHovered[index] ? Colors.white : Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidgetMob(
                      size: widget.size,
                      text: _skillLabel[index],
                      tSize: 35,
                    ),
                    SizedBox(width:10 ,),
                    FaIcon(
                      icons[index],
                      color: AppColors.limeGreen3,
                      semanticLabel: 'icon',
                    )
                  ],
                ),
                const SizedBox(height: 10,),
                TextWidgetMob(
                  size: widget.size,
                  text: _skillValue[index],
                  tSize: 27,
                ),

              ],
            )
          ),
        );
      },
    );
  }
}

class TextWidgetMob extends StatelessWidget {
  final Size size;
  final String text;
  final double tSize; // Base text size to scale from

  const TextWidgetMob({
    super.key,
    required this.size,
    required this.text,
    required this.tSize,
  });

  @override
  Widget build(BuildContext context) {
    final scaledFontSize = size.width * (tSize / 700);

    return Text(
      text,
      style: TextStyle(
        fontSize: scaledFontSize,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',

      ),
      maxLines: 3,
    );
  }
}

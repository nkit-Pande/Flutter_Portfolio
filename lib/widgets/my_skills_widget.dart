import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/appcolors.dart';

class MySkillsWidget extends StatefulWidget {
  final Size size;
  final bool isTab;
  const MySkillsWidget({super.key, required this.size,this.isTab = false});

  @override
  State<MySkillsWidget> createState() => _MySkillsWidgetState();
}

class _MySkillsWidgetState extends State<MySkillsWidget> {
  final List<bool> _isHovered = [false, false, false, false, false];
  final List<String> _skillLabel = [
    "Programming Language",
    "Frameworks",
    "Version Control",
    "Development Tools",
    "Database"
  ];
  final List<String> _skillValue = [
    "Java, Kotlin, Javascript",
    "React Native, Jetpack Compose, Flutter",
    "Git",
    "Android Studio, VSCode, Postman, IntelliJ IDE",
    "MySQL, SQLite"
  ];
  final List<IconData> icons = [
    FontAwesomeIcons.code,
    FontAwesomeIcons.fileCode,
    FontAwesomeIcons.codeFork,
    FontAwesomeIcons.tools,
    FontAwesomeIcons.database
  ];
  final List<IconData> icons2 = [
    FontAwesomeIcons.laptopCode,
    FontAwesomeIcons.solidFileCode,
    FontAwesomeIcons.codeMerge,
    FontAwesomeIcons.screwdriver,
    FontAwesomeIcons.box
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: _isHovered.length,
        separatorBuilder: (context, index) => Divider(
          height: 3,
          color: Colors.grey.shade200,
        ),
        itemBuilder: (context, index) {
          return MouseRegion(
            onEnter: (_) => setState(() => _isHovered[index] = true),
            onExit: (_) => setState(() => _isHovered[index] = false),
            child: AnimatedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              duration: const Duration(microseconds: 300),
              // margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.019),
              height: !widget.isTab ? widget.size.height * 0.15 : widget.size.height * 0.1,
              width: widget.size.width,
              decoration: BoxDecoration(
                  color: _isHovered[index] ? null : Colors.transparent,
                  gradient: _isHovered[index]
                      ? const LinearGradient(colors: [
                          AppColors.limeGreen1,
                          AppColors.appleGreen,
                        ])
                      : null,
                  border: Border.all(
                      width: 0.2,
                      color:
                          _isHovered[index] ? Colors.white : Colors.transparent),
                  borderRadius: const BorderRadius.all(Radius.circular(0))),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: widget.size.width * 0.019),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        TextWidget(
                          size: widget.size,
                          text: _skillLabel[index],
                          tSize: 27,
                          thin: true,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextWidget(
                          size: widget.size,
                          text: _skillValue[index],
                          tSize: 21,
                        ),
                        SizedBox(width: widget.size.height * 0.04),
                        FaIcon(
                          _isHovered[index] ? icons[index]:icons2[index],
                          color: _isHovered[index]
                              ? Colors.white
                              : AppColors.limeGreen3,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final Size size;
  final String text;
  final double tSize; // Base text size to scale from
  final bool thin;
  const TextWidget({
    super.key,
    required this.size,
    required this.text,
    required this.tSize,
    this.thin = false
  });

  @override
  Widget build(BuildContext context) {
    final scaledFontSize = size.width * (tSize / 1600);

    return Text(
      text,
      style: TextStyle(
        fontSize: scaledFontSize,
        color: Colors.white,
        fontWeight: !thin ? FontWeight.w400: FontWeight.w700,
        fontFamily: 'Poppins',
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    );
  }
}
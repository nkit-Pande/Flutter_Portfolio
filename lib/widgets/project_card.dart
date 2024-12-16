import 'package:flutter/material.dart';
import 'dart:async';
import 'package:portfolio/utils/appcolors.dart';

class ProjectCard extends StatefulWidget {
  final String mainText1;
  final String mainText2;
  final String path;
  final Color color;
  final Color cardColor;
  final bool isTab;
  final bool isMob;

  const ProjectCard(
      {super.key,
        required this.mainText1,
        this.mainText2 = "",
        this.path = 'assets/images/isshin.jpeg',
        this.color = AppColors.limeGreen3,
        this.cardColor = Colors.white,
        this.isMob = false,
        this.isTab = false});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _hoverExpanded = false;
  Timer? _hoverTimer;

  late double titleSize;
  late double bodySize;
  late double cardWidth;
  late double cardHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    titleSize = widget.isTab ? size.width * 0.017 : widget.isMob ? size.width * 0.019 : size.width * 0.011;
    bodySize = size.width * 0.011;


    return MouseRegion(
      onEnter: (_) => startHoverTimer(),
      onExit: (_) => stopHover(),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0, // Slight scale-up on hover
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        child: Container(
          width:  size.width,
          height:  size.height,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10), // Increased border radius
            border: Border.all(
              color: _isHovered ? Colors.white : widget.color,
              width: _isHovered ? 3 : 0,
            ),
          ),
          child: Stack(
            children: [
              // Image section with fixed size
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 5, right: 5),
                  height: size.height * 0.47,
                  width:  size.width * 0.86,
                  child: Image.asset(
                    widget.path,
                    fit: widget.isTab ? BoxFit.scaleDown : widget.isMob ? BoxFit.scaleDown : BoxFit.contain,
                  ),
                ),
              ),
              // Text and hover info
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 500),
                  height: _hoverExpanded
                      ? size.height
                      : (_isHovered
                      ? (widget.isMob
                      ? size.height * 0.5
                      : widget.isTab
                      ? size.height * 0.07
                      : size.height * 0.1)
                      : 0), // Adj
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: widget.color == Colors.white
                        ? Colors.blueAccent
                        : Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                widget.mainText1,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: titleSize, // Adjust title size dynamically
                                    color: widget.color == Colors.white
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            if (_hoverExpanded && widget.mainText2.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  widget.mainText2,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      fontSize: bodySize, // Adjust body size dynamically
                                      color: widget.color == Colors.white
                                          ? Colors.white
                                          : Colors.black),
                                  maxLines: 20,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

  void startHoverTimer() {
    setState(() {
      _isHovered = true;
    });
    _hoverTimer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _hoverExpanded = true;
      });
    });
  }

  void stopHover() {
    setState(() {
      _isHovered = false;
      _hoverExpanded = false;
    });
    _hoverTimer?.cancel();
  }
}

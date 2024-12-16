import 'package:flutter/material.dart';
import 'dart:math' as math;
class RotatingImageContainer extends StatefulWidget {
  final bool isMobile;
  const RotatingImageContainer({super.key,this.isMobile = false});

  @override
  State<RotatingImageContainer> createState() => _RotatingImageContainerState();
}

class _RotatingImageContainerState extends State<RotatingImageContainer> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    int radius = !widget.isMobile ? 20 : 100;
    final size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_)=>setState(()=>isHovered = true),
      onExit: (_)=>setState(()=>isHovered = false),
      child: AnimatedContainer(
        duration:const Duration(microseconds: 300),
          transform: !widget.isMobile
              ? Matrix4.rotationZ(isHovered ? 0 : math.pi / 48)
              : Matrix4.identity(),
        height: !widget.isMobile ? size.width * 0.22 : size.width * 0.5,
        width: !widget.isMobile ? size.width * 0.22 : size.width * 0.5,

        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/dummy_1.jpg'),
            fit: BoxFit.cover
          ),
          border: Border.all(color:Colors.white,width: !widget.isMobile ? 2 : 1),
          borderRadius: BorderRadius.all(Radius.circular(radius as double))
        ), 
      ),
    );
  }
}

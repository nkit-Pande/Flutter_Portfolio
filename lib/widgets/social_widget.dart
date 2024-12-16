import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialWidget extends StatelessWidget {
  final bool isTab;
  const SocialWidget({super.key,this.isTab = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: !isTab ? MainAxisAlignment.start  : MainAxisAlignment.center,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.8),width: 2)),
            child: Center(
              child: IconButton(
                onPressed: () => {},
                icon: const FaIcon(FontAwesomeIcons.github),
                color: Colors.black,
                hoverColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 11,),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.blue.shade700,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade700.withOpacity(0.8),width: 2)),
            child: Center(
              child: IconButton(
                onPressed: () => {},
                icon: const FaIcon(FontAwesomeIcons.linkedinIn),
                color: Colors.black,
                hoverColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 11,),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFEB3B), // Yellow
                    Color(0xFF2196F3), // Blue
                    Color(0xFFF44336), // Red
                    Color(0xFF4CAF50), // Green
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.33, 0.66, 1.0],
                ),
                border: Border.all(color: Colors.blue.shade700.withOpacity(0.8),width: 2)),
            child: Center(
              child: IconButton(
                onPressed: () => {},
                icon: const FaIcon(FontAwesomeIcons.googlePlay),
                color: Colors.black,
                hoverColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

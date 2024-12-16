

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DownloadCv extends StatelessWidget {
  const DownloadCv({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: const Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Download Resume',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins'
            ),
          ),
          SizedBox.square(dimension: 12,),
          FaIcon(FontAwesomeIcons.download,color: Colors.white,size: 18,)
        ],
      ),
    );
  }
}

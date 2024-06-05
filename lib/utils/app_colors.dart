import 'package:flutter/material.dart';

class AppColor {
  final Color appbackgroundcolor;
  final Color textcolor;
  final Color buttonforgroundcolor;
  final Color colorwhite;
  final Color colorblack;
  final Color appbarbackgroundcolor;
  final Color emergencybuttoncolor;
  final Color bottomnavigationforcolor;
  final Color placeholderimagecolor;
  final Color listcontainer;
  final Color successColor;
  final Color primeryWhite;
  AppColor(
      {required this.appbackgroundcolor,
      required this.bottomnavigationforcolor,
      required this.textcolor,
      required this.buttonforgroundcolor,
      required this.colorwhite,
      required this.colorblack,
      required this.appbarbackgroundcolor,
      required this.emergencybuttoncolor,
      required this.placeholderimagecolor,
      required this.listcontainer,
      required this.successColor,
      required this.primeryWhite});
}

final class Appallcolor extends AppColor {
  Appallcolor()
      : super(
            successColor: const Color.fromARGB(255, 128, 229, 132),
            bottomnavigationforcolor: const Color.fromARGB(0, 0, 0, 0),
            emergencybuttoncolor: const Color.fromARGB(255, 177, 37, 42),
            appbarbackgroundcolor: const Color(0xFF202020),
            colorblack: Colors.black,
            colorwhite: Colors.white,
            appbackgroundcolor: const Color.fromRGBO(18, 18, 18, 1),
            textcolor: const Color.fromARGB(255, 225, 234, 234),
            buttonforgroundcolor: const Color.fromARGB(255, 17, 187, 180),
            placeholderimagecolor: const Color.fromARGB(255, 198, 198, 199),
            listcontainer: const Color(0xFF1E1E1E),
            primeryWhite: const Color.fromARGB(255, 215, 207, 207));
}

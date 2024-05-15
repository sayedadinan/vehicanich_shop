import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final double titleTextSize;

  const CustomAppBar({
    Key? key,
    required this.titleText,
    this.titleTextSize = 0.06,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double titleFontSize = screenWidth * titleTextSize;

    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        title: Text(
          titleText,
          style: TextStyle(
              fontFamily: 'Noto Serif',
              fontSize: titleFontSize,
              color: Appallcolor().colorwhite),
        ),
        backgroundColor: Appallcolor()
            .appbarbackgroundcolor, // Change this color to your desired color
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomServiceTextField extends StatelessWidget {
  const CustomServiceTextField({
    super.key,
    required this.enabled,
    required this.controller,
  });

  final bool enabled;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Mymediaquery().mediaquerywidth(0.07, context),
      height: Mymediaquery().mediaqueryheight(0.03, context),
      child: TextField(
        controller: controller,
        cursorColor: Appallcolor().buttonforgroundcolor,
        keyboardType: TextInputType.number,
        maxLength: 5,
        textAlign: TextAlign.center, cursorWidth: 2.0,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Appallcolor().buttonforgroundcolor),
          ),
          counterText: "",
          hintStyle: TextStyle(
            color: enabled
                ? Appallcolor().colorblack
                : Appallcolor().placeholderimagecolor,
            fontSize: 14,
          ),
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: enabled
              ? Appallcolor().colorwhite
              : Appallcolor().placeholderimagecolor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          enabled: enabled,
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Appallcolor().placeholderimagecolor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Appallcolor().buttonforgroundcolor),
          ),
          hintText: "Rate",
        ),

        // Set the width of the TextField
        // You can adjust this value according to your requirement
        // For example, width: 100,
        // You can use constraints or other layout widgets to control the width
        // of the TextField
        // width: 100,
      ),
    );
  }
}

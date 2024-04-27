import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Icon? icon;
  final Function()? onTap;
  final int? maxlength;
  const Inputfield({
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon,
    this.maxLines,
    this.onTap,
    this.maxlength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Mymediaquery().mediaquerywidth(0.02, context),
          right: Mymediaquery().mediaquerywidth(0.02, context)),
      child: TextFormField(
        onTap: onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Appallcolor().textcolor,
          filled: true,
          labelText: label,
          hintText: hinttext,
          suffixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        maxLength: maxlength,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class OTPTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const OTPTextField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());
    List<TextEditingController> otpcontroller =
        List.generate(6, (index) => TextEditingController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizedBox(
            width: Mymediaquery().mediaquerywidth(0.05, context),
            height: Mymediaquery().mediaqueryheight(0.07, context),
            child: TextField(
              controller: otpcontroller[index],
              focusNode: focusNodes[index],
              style: TextStyle(color: Appallcolor().textcolor),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
                if (onChanged != null) {
                  String otp = '';
                  for (var controller in otpcontroller) {
                    otp += controller.text;
                  }
                  onChanged!(otp);
                }
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Appallcolor().textcolor,
                counter: const Offstage(),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Appallcolor().textcolor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Appallcolor().buttonforgroundcolor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

// class CustomGradientButton extends StatelessWidget {
//   final String text;
//   final TextStyle textStyle;
//   final List<Color> gradientColors;
//   final double width;
//   final double height;
//   final double borderRadius;
//   final VoidCallback onPressed;

//   const CustomGradientButton({
//     Key? key,
//     required this.text,
//     required this.textStyle,
//     required this.gradientColors,
//     required this.width,
//     required this.height,
//     required this.borderRadius,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GradientButton(
//       text: text,
//       textStyle: textStyle,
//       gradientColors: gradientColors,
//       width: width,
//       height: height,
//       borderRadius: borderRadius,
//       onPressed: onPressed,
//     );
//   }
// }

class CustomAnimatedButton extends StatelessWidget {
  final double width;
  final String text;
  final Color selectedTextColor;
  final TransitionType transitionType;
  final TextStyle textStyle;

  const CustomAnimatedButton({
    super.key,
    required this.width,
    required this.text,
    required this.selectedTextColor,
    required this.transitionType,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedButton(
      width: width,
      text: text,
      selectedTextColor: selectedTextColor,
      transitionType: transitionType,
      textStyle: textStyle,
    );
  }
}

// class CustomServiceTextField extends StatelessWidget {
//   const CustomServiceTextField({
//     Key? key,
//     required this.enabled,
//   }) : super(key: key);

//   final bool enabled;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SizedBox(
//         height: 30,
//         child: AnimatedToggleSwitch.dual(
//           values: ['ON', 'OFF'], // Values for the switch
//           onToggleCallback: (index) {
//             // Callback when the switch is toggled
//             print('Switch toggled to index $index');
//           },
//           height: 30, // Height of the switch
//           width: 60, // Width of each toggle button
//           borderRadius: 15, // Border radius of the switch
//           enabledBackgroundColor: Colors.green, // Background color when enabled
//           disabledBackgroundColor:
//               Colors.grey, // Background color when disabled
//           enabledTextColor: Colors.white, // Text color when enabled
//           disabledTextColor: Colors.white, // Text color when disabled
//         ),
//       ),
//     );
//   }
// }

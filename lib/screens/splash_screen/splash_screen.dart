import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseDatastoring().shopidstoring();
    checkingforsplash();
  }

  Future<void> checkingforsplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(Referencekeys.shopPhone);

    await Future.delayed(const Duration(seconds: 2));

    if (data != null && data.isNotEmpty) {
      Navigator.of(context).push(FadeTransitionPageRoute(child: HomeScreen()));
    } else {
      print('there is no data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Center(
        child: Text(
          'VEHICANICH',
          style: TextStyle(
            color: Appallcolor().textcolor,
            fontSize: Mymediaquery().mediaquerywidth(0.15, context),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vehicanich_shop/data/data_provider/keys.dart';
// import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
// import 'package:vehicanich_shop/utils/app_colors.dart';
// import 'package:vehicanich_shop/utils/mediaquery.dart';
// import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({key}) : super();

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     checkingForSplash();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 6), // Adjust duration as needed
//     );
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> checkingForSplash() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString(Referencekeys.shopphone);
//     await Future.delayed(const Duration(seconds: 2));
//     if (data != null && data.isNotEmpty) {
//       Navigator.of(context).push(FadeTransitionPageRoute(child: HomeScreen()));
//     } else {
//       print('there is no data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appallcolor().appbackgroundcolor,
//       body: Center(
//         child: AnimatedOpacity(
//           opacity: _animation.value,
//           duration: Duration(seconds: 1), // Adjust duration as needed
//           child: Text(
//             'VEHICANICH',
//             style: TextStyle(
//               color: Appallcolor().textcolor,
//               fontSize: Mymediaquery().mediaquerywidth(0.15, context),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

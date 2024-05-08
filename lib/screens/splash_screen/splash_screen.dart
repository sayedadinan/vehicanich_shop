import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/screens/onboarding_screen/login_or_sign.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/bottom_navigation/bottom_list.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

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
    context.read<UserProfileBloc>().add(FetchingProfileDetails());
    checkingforsplash();
  }

  Future<void> checkingforsplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(Referencekeys.shopPhone);

    await Future.delayed(const Duration(seconds: 2));

    if (data != null && data.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => BottomBar()),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginOrsign()),
        (Route<dynamic> route) => false,
      );
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

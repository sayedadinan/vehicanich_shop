import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/data/repositories/shop_data_repositery.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/onboarding_widgets/funtions/splash_funtion.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkingforsplash(context);
    FirebaseDatastoring().shopidstoring();
    context.read<UserProfileBloc>().add(FetchingProfileDetails());
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

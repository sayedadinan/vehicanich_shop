import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/bottom_nav_blocs/bloc/bottom_nav_bloc.dart';
import 'package:vehicanich_shop/screens/home_screen/home_screen.dart';
import 'package:vehicanich_shop/screens/user_profile/user_profile.dart';
import 'package:vehicanich_shop/screens/waiting_screen/waiting_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/bottom_navigation/bottom_navigation.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});
  final List<Widget> tabs = [
    const HomeScreen(),
    const WaitingScreen(),
    const UserProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: tabs[BlocProvider.of<BottomNavigationBloc>(context, listen: true)
          .state
          .page],
      bottomNavigationBar: const CustomBottomNavigationbar(),
    );
  }
}

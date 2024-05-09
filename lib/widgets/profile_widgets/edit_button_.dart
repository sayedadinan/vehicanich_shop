import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/profile_widgets/profile_update_screen.dart';

class edit_button extends StatelessWidget {
  const edit_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Mymediaquery().mediaquerywidth(0.43, context),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Appallcolor().appbarbackgroundcolor),
          onPressed: () {
            Navigator.of(context).push(
                FadeTransitionPageRoute(child: const ProfileUpdationPage()));
          },
          child: Text(
            'Edit Profile',
            style: TextStyle(
                color: Appallcolor().colorwhite,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/profile_image/bloc/image_updation_bloc.dart';
import 'package:vehicanich_shop/screens/ratings_and_revices/ratings_and_review.dart';
import 'package:vehicanich_shop/screens/shop_details/shop_details_showing.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';
import 'package:vehicanich_shop/widgets/profile_widgets/edit_button_.dart';
import 'package:vehicanich_shop/widgets/profile_widgets/profile_screen_list.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<UserProfileBloc>().add(FetchingProfileDetails());
    context.read<ImageUpdationBloc>().add(FetchingProfileImage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppbarText(
          text: 'Profile',
        ),
        centerTitle: true,
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Container(
                  child: Column(children: [
            CustomSizedBoxHeight(0.03),
            SizedBox(
                width: Mymediaquery().mediaquerywidth(0.29, context),
                height: Mymediaquery().mediaqueryheight(0.12, context),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(state.shopImage, fit: BoxFit.fill))),
            CustomSizedBoxHeight(0.02),
            Text(state.userName,
                style: TextStyle(
                    color: Appallcolor().colorwhite,
                    fontWeight: FontWeight.w600,
                    fontSize: Mymediaquery().mediaquerywidth(0.05, context))),
            Text(state.email,
                style: TextStyle(
                    color: Appallcolor().colorwhite,
                    fontWeight: FontWeight.w400,
                    fontSize: Mymediaquery().mediaquerywidth(0.04, context))),
            CustomSizedBoxHeight(0.02),
            const edit_button(),
            CustomSizedBoxHeight(0.02),
            const Divider(),
            CustomSizedBoxHeight(0.02),
            const profile_list_widget(
              icon: Icons.settings,
              text: 'settings',
            ),
            CustomSizedBoxHeight(0.03),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      FadeTransitionPageRoute(child: const ShopDetailPage()));
                },
                child: const profile_list_widget(
                    icon: Icons.shop, text: 'shop details')),
            CustomSizedBoxHeight(0.03),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    FadeTransitionPageRoute(child: const RatingsAndReviews()));
              },
              child: const profile_list_widget(
                icon: Icons.rate_review,
                text: 'ratings and reviews',
              ),
            )
          ])));
        },
      ),
    );
  }
}

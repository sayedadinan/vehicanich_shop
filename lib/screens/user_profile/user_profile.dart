import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/screens/shop_details/shop_details_showing.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

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
              child: Column(
                children: [
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context),
                  ),
                  SizedBox(
                    width: Mymediaquery().mediaquerywidth(0.29, context),
                    height: Mymediaquery().mediaqueryheight(0.12, context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        state.shopImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context),
                  ),
                  Text(
                    state.userName,
                    style: TextStyle(
                        color: Appallcolor().colorwhite,
                        fontWeight: FontWeight.w600,
                        fontSize:
                            Mymediaquery().mediaquerywidth(0.05, context)),
                  ),
                  Text(
                    state.email,
                    style: TextStyle(
                        color: Appallcolor().colorwhite,
                        fontWeight: FontWeight.w400,
                        fontSize:
                            Mymediaquery().mediaquerywidth(0.04, context)),
                  ),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context),
                  ),
                  SizedBox(
                    width: Mymediaquery().mediaquerywidth(0.43, context),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Appallcolor().appbarbackgroundcolor),
                        onPressed: () {
                          Navigator.of(context).push(
                              FadeTransitionPageRoute(child: ShopDetailPage()));
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Appallcolor().colorwhite,
                              fontSize: Mymediaquery()
                                  .mediaquerywidth(0.04, context)),
                        )),
                  ),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context),
                  ),
                  const Divider(),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context),
                  ),
                  const profile_list_widget(
                    icon: Icons.settings,
                    text: 'settings',
                  ),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context),
                  ),
                  const profile_list_widget(
                    icon: Icons.shop,
                    text: 'shop details',
                  ),
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context),
                  ),
                  const profile_list_widget(
                    icon: Icons.rate_review,
                    text: 'ratings and reviews',
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class profile_list_widget extends StatelessWidget {
  final String text;
  final IconData icon;
  const profile_list_widget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
            color: Appallcolor().textcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        width: Mymediaquery().mediaquerywidth(0.13, context),
        height: Mymediaquery().mediaqueryheight(0.12, context),
        child: Icon(
          icon,
          color: Appallcolor().textcolor,
        ),
      ),
      title: Text(
        text,
        style: TextStyle(
            color: Appallcolor().colorwhite,
            fontWeight: FontWeight.w400,
            fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
      ),
      trailing: Container(
        decoration: BoxDecoration(
            color: Appallcolor().textcolor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100)),
        width: Mymediaquery().mediaquerywidth(0.09, context),
        height: Mymediaquery().mediaqueryheight(0.04, context),
        child: Icon(Icons.arrow_forward_ios,
            size: 24, color: Appallcolor().textcolor),
      ),
    );
  }
}

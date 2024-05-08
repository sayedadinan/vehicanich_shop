import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/profile_widgets/text_changing.dart';

class ProfileUpdationPage extends StatefulWidget {
  const ProfileUpdationPage({super.key});

  @override
  State<ProfileUpdationPage> createState() => _ProfileUpdationPageState();
}

class _ProfileUpdationPageState extends State<ProfileUpdationPage> {
  @override
  void initState() {
    super.initState();
    profileInitialDataTransfer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Updat',
          style: TextStyle(
              color: Appallcolor().colorwhite,
              fontSize: Mymediaquery().mediaquerywidth(0.07, context)),
        ),
        centerTitle: true,
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: Column(
        children: [
          SizedBox(height: Mymediaquery().mediaqueryheight(0.04, context)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              width: Mymediaquery().mediaquerywidth(0.7, context),
              height: Mymediaquery().mediaqueryheight(0.18, context),
              child: Image.network(
                  BlocProvider.of<UserProfileBloc>(context).state.shopImage),
            )
          ]),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
          Inputfield(
            hinttext: 'Username',
            controller: updateUserNameController,
          ),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
          Inputfield(hinttext: 'Email', controller: updateEmailController),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
          Inputfield(hinttext: '', controller: updatePhoneController),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
          Inputfield(
            hinttext: 'Password',
            controller: updatePasswordController,
          ),
          SizedBox(height: Mymediaquery().mediaqueryheight(0.02, context)),
          Container(
            decoration: BoxDecoration(
                color: Appallcolor().textcolor,
                borderRadius: BorderRadius.circular(12)),
            width: Mymediaquery().mediaquerywidth(0.26, context),
            height: Mymediaquery().mediaqueryheight(0.05, context),
            child: const Center(
                child: Text(
              'Save Profile',
              style: TextStyle(fontWeight: FontWeight.w500),
            )),
          )
        ],
      ),
    );
  }
}

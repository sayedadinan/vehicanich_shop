import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/bloc/user_profile_bloc.dart';
import 'package:vehicanich_shop/blocs/user_profile_bloc/profile_image/bloc/image_updation_bloc.dart';
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
    context.read<ImageUpdationBloc>().add(FetchingProfileImage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update',
          style: TextStyle(
              color: Appallcolor().colorwhite,
              fontSize: Mymediaquery().mediaquerywidth(0.07, context)),
        ),
        centerTitle: true,
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      backgroundColor: Appallcolor().appbackgroundcolor,
      body: BlocBuilder<ImageUpdationBloc, ImageUpdationState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.04, context)),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ImageUpdationBloc>()
                          .add(ProfileImagePicked());
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        width: Mymediaquery().mediaquerywidth(0.7, context),
                        height: Mymediaquery().mediaqueryheight(0.18, context),
                        child: state.newImagePath.isEmpty
                            ? Image.network(state.previosImagePath)
                            : Image.memory(state.profileUpdationImageUnit!)),
                  )
                ]),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context)),
                Inputfield(
                  hinttext: 'Username',
                  controller: updateUserNameController,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                    hinttext: 'Email', controller: updateEmailController),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(hinttext: '', controller: updatePhoneController),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                  hinttext: 'Password',
                  controller: updatePasswordController,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                GestureDetector(
                  onTap: () {
                    context
                        .read<ImageUpdationBloc>()
                        .add(ProfileImageUpdationPressed(context: context));
                    context
                        .read<UserProfileBloc>()
                        .add(UserProfileUpdateSavePressed(
                          userName: updateUserNameController.text,
                          whatsApp: updatePhoneController.text,
                          email: updateEmailController.text,
                          password: updatePasswordController.text,
                        ));
                    Navigator.of(context).pop();
                    // Navigator.of(context).push(
                    //     FadeTransitionPageRoute(child: UserProfilePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Appallcolor().textcolor,
                        borderRadius: BorderRadius.circular(12)),
                    width: Mymediaquery().mediaquerywidth(0.29, context),
                    height: Mymediaquery().mediaqueryheight(0.05, context),
                    child: const Center(
                        child: Text(
                      'Save Profile',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

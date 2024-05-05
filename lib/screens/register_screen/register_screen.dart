import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/app_validators.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/banner_photo_container.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/emergency_service/emergency_container.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/error_widgets/bannerphoto_error.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/error_widgets/closing_time_error.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/error_widgets/licence_error.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/error_widgets/location_error.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/error_widgets/service_error.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/error_widgets/starting_time_error.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_button.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/licence_imagecontainer.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/mm_image_container.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/closing_time_container.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/location_container.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/starting_time_container.dart';
import 'package:vehicanich_shop/widgets/sign_in_widgets/all_texts.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Appallcolor().appbackgroundcolor,
        body: BlocConsumer<RegistrationBloc, RegistrationState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is Registrationloading) {
              return loader;
            }
            return SingleChildScrollView(
                child: Form(
              key: signupKey,
              child: Column(children: [
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.15, context)),
                const MainText(text: ' Welcome to vehicanich !'),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.05, context)),
                const Smallheading(text: 'Details', width: 0.6),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                  hinttext: 'Name',
                  validator: (value) =>
                      Validators().validateEmpty('Name', value),
                  controller: namecontroller,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                  hinttext: 'Email',
                  validator: (value) => Validators().validateEmail(value),
                  controller: emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                  maxlength: 10,
                  hinttext: 'phone',
                  validator: (value) => Validators().validatePhoneNumber(value),
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                  maxlength: 10,
                  hinttext: 'Whatsapp Number',
                  validator: (value) => Validators().validatePhoneNumber(value),
                  controller: whatsappcontroller,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                    hinttext: 'password',
                    validator: (value) => Validators().validatePassword(value),
                    controller: passwordcontroller),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                    hinttext: 'consfirm password',
                    validator: (value) => Validators()
                        .validatePasswordMatch(value!, passwordcontroller.text),
                    controller: confirmpassword),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                    hinttext: 'Shop Name',
                    validator: (value) =>
                        Validators().validateEmpty('Shop name', value),
                    controller: shopnamecontroller),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const LocationTextContainer(),
                const LocationErrorText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Inputfield(
                    hinttext: 'Description',
                    controller: descriptioncontroller,
                    maxLines: 4,
                    validator: (value) => Validators().validateText(value)),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const StartingTimeTextContainer(),
                const StartingtimeErrorText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const ClosingTimeTextContainer(),
                const ClosingtimeErrorText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const Smallheading(text: 'Proofs', width: 0.6),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.05, context),
                        right: 0),
                    child: const Row(children: [
                      MMImageContainer(),
                      LicenceImagecontainer()
                    ])),
                const LicenceErrorText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.01, context)),
                const Smallheading(text: 'Photos', width: 0.6),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.01, context)),
                const HintText(size: 0.09, text: 'Banner photo'),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.01, context)),
                const BannerImagecontainer(),
                const BannerErrorText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const BodyServiceContainer(text: 'Add All services'),
                const ServiceErrorText(),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                const EmergencyButton(text: 'Add emergency services'),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.02, context)),
                CustomButton(
                    function: () {
                      context.read<RegistrationBloc>().add(
                          Registerbuttonpressed(context: context, signupKey));
                    },
                    buttontextcolor: Appallcolor().colorwhite,
                    text: 'Register',
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                    color: Appallcolor().buttonforgroundcolor),
                SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.04, context)),
              ]),
            ));
          },
        ));
  }
}

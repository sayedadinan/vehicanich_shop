import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/registration_button_bloc/bloc/registration_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/app_loadingindicator.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_textfields.dart';
import 'package:vehicanich_shop/utils/app_validators.dart';
import 'package:vehicanich_shop/utils/constant_variables/app_strings.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/banner_photo_container.dart';
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
          listener: (context, state) {
            if (state is PhoneNumberAlreadyRegistered) {
              final snackBar = SnackBar(
                padding: const EdgeInsets.all(26),
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Oops',
                  message: 'this phone already registered',
                  contentType: ContentType.failure,
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is Registrationloading) {
              return Center(
                child: loader,
              );
            }
            return SingleChildScrollView(
                child: Form(
              key: signupKey,
              child: Column(children: [
                CustomSizedBoxHeight(0.15),
                MainText(text: AppString.registerHead),
                CustomSizedBoxHeight(0.05),
                Smallheading(text: AppString.secHead, width: 0.6),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                  hinttext: 'Name',
                  validator: (value) =>
                      Validators().validateEmpty('Name', value),
                  controller: namecontroller,
                ),
                CustomSizedBoxHeight(0.02),
                // Inputfield(
                //   hinttext: 'Email',
                //   validator: (value) => Validators().validateEmail(value),
                //   controller: emailcontroller,
                //   keyboardType: TextInputType.emailAddress,
                // ),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                  maxlength: 10,
                  hinttext: 'phone',
                  validator: (value) => Validators().validatePhoneNumber(value),
                  controller: phonecontroller,
                  keyboardType: TextInputType.phone,
                ),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                  maxlength: 10,
                  hinttext: 'Whatsapp Number',
                  validator: (value) => Validators().validatePhoneNumber(value),
                  controller: whatsappcontroller,
                  keyboardType: TextInputType.phone,
                ),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                    hinttext: 'password',
                    validator: (value) => Validators().validatePassword(value),
                    controller: passwordcontroller),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                    hinttext: 'consfirm password',
                    validator: (value) => Validators()
                        .validatePasswordMatch(value!, passwordcontroller.text),
                    controller: confirmpassword),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                    hinttext: 'Shop Name',
                    validator: (value) =>
                        Validators().validateEmpty('Shop name', value),
                    controller: shopnamecontroller),
                CustomSizedBoxHeight(0.02),
                const LocationTextContainer(),
                const LocationErrorText(),
                CustomSizedBoxHeight(0.02),
                Inputfield(
                    hinttext: 'Description',
                    controller: descriptioncontroller,
                    maxLines: 4,
                    validator: (value) => Validators().validateText(value)),
                CustomSizedBoxHeight(0.02),
                const StartingTimeTextContainer(),
                const StartingtimeErrorText(),
                CustomSizedBoxHeight(0.02),
                const ClosingTimeTextContainer(),
                const ClosingtimeErrorText(),
                CustomSizedBoxHeight(0.02),
                Smallheading(text: AppString.proofHead, width: 0.6),
                CustomSizedBoxHeight(0.02),
                Padding(
                    padding: EdgeInsets.only(
                        left: Mymediaquery().mediaquerywidth(0.05, context),
                        right: 0),
                    child: const Row(children: [
                      MMImageContainer(),
                      LicenceImagecontainer()
                    ])),
                const LicenceErrorText(),
                CustomSizedBoxHeight(0.03),
                Smallheading(text: AppString.photoHead, width: 0.6),
                CustomSizedBoxHeight(0.02),
                HintText(size: 0.09, text: AppString.bannerHead),
                CustomSizedBoxHeight(0.02),
                const BannerImagecontainer(),
                const BannerErrorText(),
                CustomSizedBoxHeight(0.04),
                BodyServiceContainer(text: AppString.allServiceTxt),
                const ServiceErrorText(),
                CustomSizedBoxHeight(0.04),
                CustomButton(
                    function: () {
                      context.read<RegistrationBloc>().add(
                          Registerbuttonpressed(context: context, signupKey));
                    },
                    buttontextcolor: Appallcolor().colorwhite,
                    text: 'Register',
                    fontSize: Mymediaquery().mediaqueryheight(0.02, context),
                    color: Appallcolor().buttonforgroundcolor),
                CustomSizedBoxHeight(0.04),
              ]),
            ));
          },
        ));
  }
}

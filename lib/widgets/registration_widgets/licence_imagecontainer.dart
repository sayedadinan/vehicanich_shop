import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class LicenceImagecontainer extends StatelessWidget {
  const LicenceImagecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state is ImageInitial && state.licenceimagepath.isNotEmpty) {
          return GestureDetector(
            onTap: () {
              context.read<ImageBloc>().add(LicencseImagePicker());
            },
            child: Container(
              decoration: BoxDecoration(
                color: Appallcolor().textcolor,
                border: Border.all(
                  color: Appallcolor().textcolor,
                  width: 3,
                ),
              ),
              width: Mymediaquery().mediaquerywidth(0.20, context),
              height: Mymediaquery().mediaqueryheight(0.12, context),
              child: Image.memory(
                state.licenceimagepathunit!,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<ImageBloc>().add(LicencseImagePicker());
                      print('licence started');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Appallcolor().textcolor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Appallcolor().textcolor,
                          width: 2,
                        ),
                      ),
                      width: Mymediaquery().mediaquerywidth(0.20, context),
                      height: Mymediaquery().mediaqueryheight(0.12, context),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 29,
                          ),
                          CustomText(
                            width: FontWeight.w400,
                            color: Appallcolor().colorblack,
                            fontSize:
                                Mymediaquery().mediaquerywidth(0.01, context),
                            text:
                                'Please upload your licence photo\n for validation  Thank you',
                          ),
                          CustomText(
                            width: FontWeight.w400,
                            color: Appallcolor().colorblack,
                            fontSize:
                                Mymediaquery().mediaquerywidth(0.01, context),
                            text: '(tap here)',
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const LicenceImagecontainer(),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}

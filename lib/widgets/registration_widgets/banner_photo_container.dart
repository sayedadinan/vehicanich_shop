import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class BannerImagecontainer extends StatelessWidget {
  const BannerImagecontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        if (state is ImageInitial && state.bannerimagepath.isNotEmpty)
          GestureDetector(
            onTap: () {
              context.read<ImageBloc>().add(BannerImagePicker());
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.0, context)),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Appallcolor().textcolor,
                    width: 3,
                  ),
                ),
                width: Mymediaquery().mediaquerywidth(0.87, context),
                height: Mymediaquery().mediaqueryheight(0.12, context),
                child: Image.memory(
                  state.bannerimagepathunit!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        else
          GestureDetector(
            onTap: () {
              context.read<ImageBloc>().add(BannerImagePicker());
              print('started banner');
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.01, context)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 3,
                  ),
                  color: Appallcolor().textcolor,
                ),
                width: Mymediaquery().mediaquerywidth(0.90, context),
                // width: double.infinity,
                height: Mymediaquery().mediaqueryheight(0.12, context),
                child: Column(
                  children: [
                    SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.04, context),
                    ),
                    CustomText(
                      width: FontWeight.w400,
                      color: Appallcolor().colorblack,
                      fontSize: Mymediaquery().mediaquerywidth(0.03, context),
                      text:
                          'Please upload your shop photo here for showing to customer',
                    ),
                    SizedBox(
                      height: Mymediaquery().mediaqueryheight(0.01, context),
                    ),
                    CustomText(
                      width: FontWeight.w300,
                      color: Appallcolor().colorblack,
                      fontSize: Mymediaquery().mediaquerywidth(0.03, context),
                      text: '(tap here)',
                    ),
                  ],
                ),
              ),
            ),
          ),
        // SizedBox(width: Mymediaquery().mediaquerywidth(0.02, context)),
      ]);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/image_blocs/image_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_texts.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class MMImageContainer extends StatelessWidget {
  const MMImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(builder: (context, state) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        if (state is ImageInitial && state.mmimagepath.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Appallcolor().textcolor,
              border: Border.all(
                color: Appallcolor().textcolor,
                width: 3,
              ),
            ),
            width: Mymediaquery().mediaquerywidth(0.20, context),
            height: Mymediaquery().mediaqueryheight(0.12, context),
            child: Image.memory(
              state.mmimagepathunit!,
              fit: BoxFit.cover,
            ),
          )
        else
          GestureDetector(
            onTap: () {
              context.read<ImageBloc>().add(MMImagePicker());
              print('started mm');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Appallcolor().textcolor,
                border: Border.all(
                  color: Appallcolor().textcolor,
                  width: 2,
                ),
              ),
              width: Mymediaquery().mediaquerywidth(0.20, context),
              height: Mymediaquery().mediaqueryheight(0.12, context),
              child: Column(
                children: [
                  SizedBox(
                    height: Mymediaquery().mediaqueryheight(0.03, context),
                  ),
                  CustomText(
                    width: FontWeight.w400,
                    color: Appallcolor().colorblack,
                    fontSize: Mymediaquery().mediaquerywidth(0.01, context),
                    text:
                        'Please upload your merchandise\n mark to showcase your branding',
                  ),
                  CustomText(
                    width: FontWeight.w300,
                    color: Appallcolor().colorblack,
                    fontSize: Mymediaquery().mediaquerywidth(0.01, context),
                    text: '(tap here)',
                  ),
                ],
              ),
            ),
          ),
        SizedBox(width: Mymediaquery().mediaquerywidth(0.01, context)),
      ]);
    });
  }
}

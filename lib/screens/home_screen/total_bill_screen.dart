import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/current_status_/bloc/current_status_bloc.dart';
import 'package:vehicanich_shop/blocs/wallet/total_bill_bloc/bloc/total_bill_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_bar_text.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_google_button.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/constant_variables/textediting_controller.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/total_bill_screen_widgets/total_bill_texts.dart';

class TotalBillScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const TotalBillScreen({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: const CustomAppBar(
        titleText: 'Total BIll',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBoxHeight(0.06),
              const SmallText(smallText: 'service'),
              HeadTexts(headText: shop[Referencekeys.serviceName]),
              CustomSizedBoxHeight(0.02),
              const SmallText(smallText: 'vehicle number'),
              HeadTexts(headText: shop[Referencekeys.vahicleNumber]),
              CustomSizedBoxHeight(0.02),
              const SmallText(smallText: 'extra service'),
              CustomSizedBoxHeight(0.01),
              TotalBIllTextField(
                controller: extraServiceController,
                maxLine: 4,
                hintText: 'write extra services here..',
              ),
              CustomSizedBoxHeight(0.02),
              const SmallText(smallText: 'any extra fittings?'),
              CustomSizedBoxHeight(0.01),
              TotalBIllTextField(
                controller: extraFittingsController,
                maxLine: 2,
                hintText: 'write extra fittings or parts..',
              ),
              CustomSizedBoxHeight(0.05),
              Row(
                children: [
                  CustomSizedBoxWidth(0.05),
                  const HeadTexts(headText: 'Total Amount'),
                  CustomSizedBoxWidth(0.05),
                  SizedBox(
                    width: Mymediaquery().mediaquerywidth(0.4, context),
                    child: TotalBIllTextField(
                      controller: totalBillMoneyController,
                      maxLine: 2,
                      hintText: '',
                    ),
                  ),
                ],
              ),
              CustomSizedBoxHeight(0.05),
              Padding(
                padding: EdgeInsets.only(
                    right: Mymediaquery().mediaquerywidth(0.05, context)),
                child: CustomGoogleButton(
                  bordercolor: Appallcolor().primeryWhite,
                  buttontextcolor: Appallcolor().primeryWhite,
                  color: Colors.transparent,
                  fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                  function: () {
                    context
                        .read<CurrentStatusBloc>()
                        .add(DoneButtonPressed(documentId: shop.id));

                    context.read<TotalBillBloc>().add(TotalBillAdded(
                          serviceName: shop[Referencekeys.serviceName],
                          vehicleNumber: shop[Referencekeys.vahicleNumber],
                          extraService: extraServiceController.text,
                          extraFitting: extraFittingsController.text,
                          totalAmount: totalBillMoneyController.text,
                          customerId: shop.id,
                        ));
                    Navigator.of(context).pop();
                  },
                  text: 'SEND BILL',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

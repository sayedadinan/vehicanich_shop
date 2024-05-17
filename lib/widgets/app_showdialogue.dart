import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/constant_variables/enums.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/widgets/home_widgets/buttons_.dart';
import 'package:vehicanich_shop/widgets/home_widgets/custom_texts_for_bookings.dart';

void showDetailsDialog(
  QueryDocumentSnapshot<Object?> bookingDetails,
  BuildContext context,
  final CurrentStatus currentStatus,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
            Container(
                decoration: BoxDecoration(
                    // color: Appallcolor().colorblack,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Appallcolor().textcolor)),
                width: Mymediaquery().mediaquerywidth(0.68, context),
                height: Mymediaquery().mediaqueryheight(0.27, context),
                child: Column(
                  children: [
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.05, context)),
                    DialogueBoxText(
                      keyval: 'service name',
                      valuetext: bookingDetails[Referencekeys.serviceName],
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    DialogueBoxText(
                      keyval: 'customer phone',
                      valuetext: bookingDetails[Referencekeys.userPhone],
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    DialogueBoxText(
                      keyval: 'vehicle number',
                      valuetext: bookingDetails[Referencekeys.vahicleNumber],
                    ),
                    SizedBox(
                        height: Mymediaquery().mediaqueryheight(0.02, context)),
                    DialogueBoxText(
                      keyval: 'booking date',
                      valuetext: bookingDetails[Referencekeys.date],
                    ),
                  ],
                )),
          ],
        ),
        actions: [
          Row(
            children: [
              switch (currentStatus) {
                CurrentStatus.done => DoneBUtton(shop: bookingDetails),
                CurrentStatus.pending => StartedBUtton(shop: bookingDetails),
                CurrentStatus.started => CompletedBUtton(shop: bookingDetails)
              },
              SizedBox(
                width: Mymediaquery().mediaquerywidth(0.03, context),
              ),
              CancelButton(
                shop: bookingDetails,
              )
            ],
          ),
        ],
      );
    },
  );
}

class DialogueBoxText extends StatelessWidget {
  final String keyval;
  final String valuetext;
  const DialogueBoxText(
      {super.key, required this.keyval, required this.valuetext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.05, context)),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.31, context),
          child: CustomTextforList(text: keyval),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: Mymediaquery().mediaquerywidth(0.03, context),
            color: Appallcolor().textcolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.02, context)),
          child: SizedBox(
            width: Mymediaquery().mediaquerywidth(0.28, context),
            child: Text(
              valuetext,
              style: TextStyle(
                  color: Appallcolor().textcolor,
                  fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/current_status_/bloc/current_status_bloc.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/screens/chat_room/chat_screen.dart';
import 'package:vehicanich_shop/screens/home_screen/total_bill_screen.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';
import 'package:vehicanich_shop/utils/page_transition/page_fade_transition.dart';

class StartedBUtton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const StartedBUtton({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Mymediaquery().mediaqueryheight(0.04, context),
      width: Mymediaquery().mediaquerywidth(0.32, context),
      child: CustomButton(
        color: Appallcolor().successColor,
        function: () {
          context
              .read<CurrentStatusBloc>()
              .add(StartedbuttonPressed(documentId: shop.id));
          Navigator.of(context).pop();
        },
        text: 'start work',
        fontSize: Mymediaquery().mediaquerywidth(0.03, context),
        buttontextcolor: Colors.black,
      ),
    );
  }
}

class CompletedBUtton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const CompletedBUtton({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Mymediaquery().mediaqueryheight(0.04, context),
      width: Mymediaquery().mediaquerywidth(0.32, context),
      child: CustomButton(
        color: Appallcolor().successColor,
        function: () {
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: TotalBillScreen(
            shop: shop,
          )));
        },
        text: 'Completed',
        fontSize: Mymediaquery().mediaquerywidth(0.03, context),
        buttontextcolor: Colors.white,
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const CancelButton({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Mymediaquery().mediaqueryheight(0.04, context),
      width: Mymediaquery().mediaquerywidth(0.32, context),
      child: CustomButton(
        color: Appallcolor().textcolor,
        function: () {
          Navigator.of(context).push(FadeTransitionPageRoute(
              child: ChatPage(
                  receiverUserPhone: shop[Referencekeys.userEmail],
                  receiverUserID: shop[Referencekeys.customerId])));
        },
        text: 'Message',
        fontSize: Mymediaquery().mediaquerywidth(0.03, context),
        buttontextcolor: Colors.black,
      ),
    );
  }
}

class DoneBUtton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const DoneBUtton({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Mymediaquery().mediaqueryheight(0.04, context),
      width: Mymediaquery().mediaquerywidth(0.32, context),
      child: CustomButton(
        color: Appallcolor().successColor,
        function: () {
          // context
          //     .read<CurrentStatusBloc>()
          //     .add(DoneButtonPressed(documentId: shop.id));
          // Navigator.of(context).pop();
        },
        text: 'Done',
        fontSize: Mymediaquery().mediaquerywidth(0.03, context),
        buttontextcolor: Colors.white,
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/current_status_/bloc/current_status_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

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
          context
              .read<CurrentStatusBloc>()
              .add(CompletedbuttonPressed(documentId: shop.id));
          Navigator.of(context).pop();
        },
        text: 'Completed',
        fontSize: Mymediaquery().mediaquerywidth(0.03, context),
        buttontextcolor: Colors.white,
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Mymediaquery().mediaqueryheight(0.04, context),
      width: Mymediaquery().mediaquerywidth(0.32, context),
      child: CustomButton(
        color: Appallcolor().textcolor,
        function: () {
          Navigator.of(context).pop();
        },
        text: 'cancel',
        fontSize: Mymediaquery().mediaquerywidth(0.03, context),
        buttontextcolor: Colors.black,
      ),
    );
  }
}

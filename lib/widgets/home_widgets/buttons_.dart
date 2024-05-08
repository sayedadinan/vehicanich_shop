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
      width: Mymediaquery().mediaquerywidth(0.90, context),
      child: CustomButton(
        color: Appallcolor().appbarbackgroundcolor,
        function: () {
          context
              .read<CurrentStatusBloc>()
              .add(StartedbuttonPressed(documentId: shop.id));
          Navigator.of(context).pop();
        },
        text: 'start work',
        fontSize: Mymediaquery().mediaquerywidth(0.04, context),
        buttontextcolor: Colors.white,
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
      width: Mymediaquery().mediaquerywidth(0.90, context),
      child: CustomButton(
        color: Appallcolor().appbarbackgroundcolor,
        function: () {
          context
              .read<CurrentStatusBloc>()
              .add(CompletedbuttonPressed(documentId: shop.id));
          Navigator.of(context).pop();
        },
        text: 'Completed',
        fontSize: Mymediaquery().mediaquerywidth(0.04, context),
        buttontextcolor: Colors.white,
      ),
    );
  }
}

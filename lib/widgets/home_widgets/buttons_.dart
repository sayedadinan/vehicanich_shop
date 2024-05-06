import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_custom_button.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class StartedBUtton extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> shop;
  const StartedBUtton({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Mymediaquery().mediaquerywidth(0.79, context),
      child: CustomButton(
        color: Colors.green,
        function: () {
          // context
          //     .read<CurrentStatusBloc>()
          //     .add(RejectedButtonPressed(documentId: shop.id));
          Navigator.of(context).pop();
        },
        text: 'started',
        fontSize: Mymediaquery().mediaquerywidth(0.02, context),
        buttontextcolor: Colors.white,
      ),
    );
  }
}

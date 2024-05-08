import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/body_service_updation/bloc/body_service_updation_bloc.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomFloatingActionButtonForUpdation extends StatelessWidget {
  const CustomFloatingActionButtonForUpdation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Mymediaquery().mediaqueryheight(0.03, context),
        right: Mymediaquery().mediaquerywidth(0.03, context),
      ),
      child: SizedBox(
        width: Mymediaquery().mediaquerywidth(0.38, context),
        height: Mymediaquery().mediaqueryheight(0.06, context),
        child: FloatingActionButton(
          onPressed: () {},
          child: BlocProvider.of<BodyServiceUpdationBloc>(context, listen: true)
                  .state
                  .servicesFromFirebase
                  .isEmpty
              ? Text(
                  'skip',
                  style: TextStyle(
                    fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                  ),
                )
              : Text(
                  'next',
                  style: TextStyle(
                    fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/widgets/registration_widgets/serivice_widgets/service_description_and_texts.dart';

Widget buildMaintenanceDescription(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(49.0),
      color: Appallcolor().appbarbackgroundcolor,
    ),
    padding: const EdgeInsets.all(16.0),
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: const Padding(
      padding: EdgeInsets.all(24.0),
      child: SizedBox(
        child: BodyMaintainceDescription(),
      ),
    ),
  );
}

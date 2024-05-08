import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:vehicanich_shop/data/data_provider/keys.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class CustomTextforList extends StatelessWidget {
  final String text;
  const CustomTextforList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Appallcolor().textcolor,
          fontSize: Mymediaquery().mediaquerywidth(0.04, context),
          fontWeight: FontWeight.w500),
    );
  }
}

class Rowforcontainer extends StatelessWidget {
  final String keytext;
  final String valuetext;
  const Rowforcontainer(
      {super.key, required this.valuetext, required this.keytext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Mymediaquery().mediaquerywidth(0.08, context)),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.32, context),
          child: CustomTextforList(text: keytext),
        ),
        Text(
          ':',
          style: TextStyle(
            fontSize: 20,
            color: Appallcolor().textcolor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.04, context)),
          child: Text(
            valuetext,
            style: TextStyle(
                color: Appallcolor().textcolor,
                fontSize: Mymediaquery().mediaquerywidth(0.04, context),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class DetailsContainerText extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> bookingDetails;
  const DetailsContainerText({super.key, required this.bookingDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Mymediaquery().mediaqueryheight(0.04, context)),
        Text('All details about booking',
            style: TextStyle(
                fontSize: Mymediaquery().mediaquerywidth(0.05, context),
                color: Appallcolor().colorwhite,
                fontWeight: FontWeight.w500)),
        SizedBox(height: Mymediaquery().mediaqueryheight(0.03, context)),
        Rowforcontainer(
          keytext: 'Service Category',
          valuetext: bookingDetails[Referencekeys.serviceName],
        ),
        SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
        Rowforcontainer(
            keytext: 'Vehicle Number',
            valuetext: bookingDetails[Referencekeys.vahicleNumber]),
        SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
        Rowforcontainer(
            keytext: 'Customer Phone',
            valuetext: bookingDetails[Referencekeys.userPhone]),
        SizedBox(height: Mymediaquery().mediaqueryheight(0.01, context)),
        Rowforcontainer(
            keytext: 'Booking Date',
            valuetext: bookingDetails[Referencekeys.date]),
      ],
    );
  }
}

class CustomisedtextforDetails extends StatelessWidget {
  final String keytext;
  final String valuetext;
  const CustomisedtextforDetails(
      {super.key, required this.keytext, required this.valuetext});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.09, context),
        ),
        Text(
          keytext,
          style: TextStyle(
              color: Appallcolor().colorblack,
              fontWeight: FontWeight.w500,
              fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.02, context),
        ),
        Text(
          ':',
          style: TextStyle(
              color: Appallcolor().colorblack,
              fontWeight: FontWeight.w500,
              fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
        ),
        SizedBox(
          width: Mymediaquery().mediaquerywidth(0.02, context),
        ),
        Text(
          valuetext,
          style: TextStyle(
              color: Appallcolor().colorblack,
              fontWeight: FontWeight.w500,
              fontSize: Mymediaquery().mediaquerywidth(0.04, context)),
        ),
      ],
    );
  }
}

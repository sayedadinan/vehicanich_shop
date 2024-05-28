import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/date_change_bloc/bloc/date_change_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/app_fonts.dart';
import 'package:vehicanich_shop/utils/app_sizedbox.dart';
import 'package:vehicanich_shop/utils/app_text.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class DateChangingPage extends StatelessWidget {
  const DateChangingPage({super.key});

  @override
  Widget build(BuildContext context) {
    late DateTime carry;
    return Scaffold(
      backgroundColor: Appallcolor().appbackgroundcolor,
      appBar: AppBar(
        backgroundColor: Appallcolor().appbarbackgroundcolor,
      ),
      body: Column(
        children: [
          CustomSizedBoxHeight(0.05),
          AppText(
            text: 'Is there any changes in working days?',
            size: 0.04,
            fontFamily: AppFonts.headText,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Mymediaquery().mediaquerywidth(0.04, context),
              right: Mymediaquery().mediaquerywidth(0.04, context),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: Mymediaquery()
                    .mediaqueryheight(0.5, context), // Adjust as needed
                maxWidth: double.infinity,
              ),
              child: EasyDateTimeLine(
                headerProps: EasyHeaderProps(
                    // showMonthPicker: false,
                    monthStyle: TextStyle(color: Appallcolor().colorwhite)),
                timeLineProps: EasyTimeLineProps(
                    backgroundColor: Appallcolor().appbarbackgroundcolor),
                // activeColor: Appallcolor().colorwhite,
                disabledDates: [DateTime.utc(2024, 05, 27)],
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  carry = selectedDate;
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: Mymediaquery().mediaquerywidth(0.26, context),
        child: FloatingActionButton(
          onPressed: () {
            context.read<DateChangeBloc>().add(DateAdded(offDate: carry));
            Navigator.of(context).pop();
          },
          child: const Text('Save Date'),
        ),
      ),
    );
  }
}

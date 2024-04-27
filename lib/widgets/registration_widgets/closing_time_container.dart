import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/closingtime_blocs/bloc/closingtime_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class ClosingTimeTextContainer extends StatelessWidget {
  const ClosingTimeTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClosingtimeBloc, ClosingtimeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (selectedTime != null) {
              context
                  .read<ClosingtimeBloc>()
                  .add(ClosingTimePicked(selectedclosingTime: selectedTime));
            }
          },
          child: Container(
            width: Mymediaquery().mediaquerywidth(0.41, context),
            height: Mymediaquery().mediaqueryheight(0.07, context),
            decoration: BoxDecoration(
              color: Appallcolor().placeholderimagecolor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.02, context),
                ),
                BlocBuilder<ClosingtimeBloc, ClosingtimeState>(
                  builder: (context, state) {
                    if (state is ClosingTimeSelected) {
                      return Text(
                        state.closingTime,
                        style: TextStyle(
                          color: Appallcolor().colorblack,
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.02, context),
                        ),
                      );
                    } else {
                      return Text(
                        'closing time',
                        style: TextStyle(
                          color: Appallcolor().colorblack,
                          fontSize:
                              Mymediaquery().mediaquerywidth(0.02, context),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  width: Mymediaquery().mediaquerywidth(0.22, context),
                ),
                const Icon(Icons.access_time)
              ],
            ),
          ),
        );
      },
    );
  }
}

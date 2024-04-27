import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/registration_blocs/startingtime_bloc.dart/bloc/time_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class StartingTimeTextContainer extends StatelessWidget {
  const StartingTimeTextContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartingTimeBloc, TimeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                context
                    .read<StartingTimeBloc>()
                    .add(StartingTimePicked(selectedstartingTime: pickedTime));
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
                  BlocBuilder<StartingTimeBloc, TimeState>(
                    builder: (context, state) {
                      if (state is StartingTimeSelected) {
                        return Text(
                          state.startingTime,
                          style: TextStyle(
                            color: Appallcolor().colorblack,
                            fontSize:
                                Mymediaquery().mediaquerywidth(0.02, context),
                          ),
                        );
                      } else {
                        return Text(
                          'starting time',
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
                    width: Mymediaquery().mediaquerywidth(0.21, context),
                  ),
                  const Icon(Icons.access_time)
                ],
              ),
            ),
          );
        });
  }
}

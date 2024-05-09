import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicanich_shop/blocs/shop_updation_blocs/time_updation_bloc/starting_time/starting_time_updation_bloc.dart';
import 'package:vehicanich_shop/utils/app_colors.dart';
import 'package:vehicanich_shop/utils/mediaquery.dart';

class StartingTimeUpdationContainer extends StatefulWidget {
  const StartingTimeUpdationContainer({super.key});

  @override
  State<StartingTimeUpdationContainer> createState() =>
      _StartingTimeUpdationContainerState();
}

class _StartingTimeUpdationContainerState
    extends State<StartingTimeUpdationContainer> {
  @override
  void initState() {
    super.initState();
    context.read<StartingTimeUpdationBloc>().add(StartingTimeFetching());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StartingTimeUpdationBloc, StartingTimeUpdationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                context.read<StartingTimeUpdationBloc>().add(
                    StartingUpdationTimePicked(
                        selectedstartingTime: pickedTime));
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: Mymediaquery().mediaquerywidth(0.06, context),
                  right: Mymediaquery().mediaquerywidth(0.06, context)),
              child: Container(
                width: double.infinity,
                height: Mymediaquery().mediaqueryheight(0.07, context),
                decoration: BoxDecoration(
                  color: Appallcolor().textcolor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.04, context),
                    ),
                    SizedBox(
                      width: Mymediaquery().mediaquerywidth(0.73, context),
                      child: BlocBuilder<StartingTimeUpdationBloc,
                          StartingTimeUpdationState>(
                        builder: (context, state) {
                          if (state is StartingTimeUpdationInitial) {
                            return Text(
                              state.startingTime,
                              style: TextStyle(
                                color: Appallcolor().colorblack,
                                fontSize: Mymediaquery()
                                    .mediaquerywidth(0.05, context),
                              ),
                            );
                          } else {
                            return Text(
                              state.startingTime,
                              style: TextStyle(
                                color: Appallcolor().colorblack,
                                fontSize: Mymediaquery()
                                    .mediaquerywidth(0.05, context),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const Icon(Icons.access_time)
                  ],
                ),
              ),
            ),
          );
        });
  }
}

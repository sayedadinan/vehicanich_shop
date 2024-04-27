import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
part 'time_event.dart';
part 'time_state.dart';

class StartingTimeBloc extends Bloc<TimeEvent, TimeState> {
  StartingTimeBloc() : super(TimeInitial(startingTime: '')) {
    on<StartingTimePicked>(timecontainerclicked);
  }
  timecontainerclicked(StartingTimePicked event, Emitter<TimeState> emit) {
    String formattedTime = DateFormat('hh:mm a').format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        event.selectedstartingTime.hour,
        event.selectedstartingTime.minute,
      ),
    );
    emit(StartingTimeSelected(startingTime: formattedTime));
  }
}

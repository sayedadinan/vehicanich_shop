import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'closingtime_event.dart';
part 'closingtime_state.dart';

class ClosingtimeBloc extends Bloc<ClosingtimeEvent, ClosingtimeState> {
  ClosingtimeBloc() : super(ClosingtimeInitial(closingTime: '')) {
    on<ClosingTimePicked>(closingtimepicked);
  }
  closingtimepicked(ClosingTimePicked event, Emitter<ClosingtimeState> emit) {
    String formattedTime = DateFormat('hh:mm a').format(
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        event.selectedclosingTime.hour,
        event.selectedclosingTime.minute,
      ),
    );
    emit(ClosingTimeSelected(closingTime: formattedTime));
  }
}

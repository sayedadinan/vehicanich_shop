import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/repositories/booking_details_repo.dart';
part 'current_status_event.dart';
part 'current_status_state.dart';

class CurrentStatusBloc extends Bloc<CurrentStatusEvent, CurrentStatusState> {
  CurrentStatusBloc() : super(CurrentStatusInitial()) {
    {
      on<StartedbuttonPressed>(startedButtonPressed);
      on<CompletedbuttonPressed>(completedButtonPressed);
      on<DoneButtonPressed>(doneButtonPressed);
    }
  }
  startedButtonPressed(
      StartedbuttonPressed event, Emitter<CurrentStatusState> emit) async {
    emit(StartedLoading());
    try {
      print('in bloc');
      await BookingDetailsUpdation().pendingDetailsUpdation(event.documentId);
      emit(StartedSucces());
    } catch (e) {
      emit(StartedError());
      print(e);
    }
  }

  completedButtonPressed(
      CompletedbuttonPressed event, Emitter<CurrentStatusState> emit) async {
    emit(CompletedLoading());
    try {
      await BookingDetailsUpdation()
          .pendingDetailsUpdationForStartedButton(event.documentId);
    } catch (e) {
      print(e);
    }
  }

  doneButtonPressed(
      DoneButtonPressed event, Emitter<CurrentStatusState> emit) async {
    try {
      await BookingDetailsUpdation()
          .doneButtonPressedUpdation(event.documentId);
    } catch (e) {
      print(e);
    }
  }
}

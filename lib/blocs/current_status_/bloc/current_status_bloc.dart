import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/repositories/booking_details_repo.dart';

part 'current_status_event.dart';
part 'current_status_state.dart';

class CurrentStatusBloc extends Bloc<CurrentStatusEvent, CurrentStatusState> {
  CurrentStatusBloc() : super(CurrentStatusInitial()) {
    {
      on<StartedbuttonPressed>(startedButtonPressed);
      on<CompletedbuttonPressed>(completedButtonPressed);
    }
  }
  startedButtonPressed(
      StartedbuttonPressed event, Emitter<CurrentStatusState> emit) async {
    emit(StartedLoading());
    try {
      await BookingDetailsUpdation().pendingDetailsUpdation(event.documentId);
      emit(StartedSucces());
    } catch (e) {
      emit(StartedError());
      print(e);
    }
  }

  completedButtonPressed(
      CompletedbuttonPressed event, Emitter<CurrentStatusState> emit) {}
}

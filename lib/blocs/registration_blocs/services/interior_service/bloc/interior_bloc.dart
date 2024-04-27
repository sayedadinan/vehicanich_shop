import 'package:bloc/bloc.dart';
part 'interior_event.dart';
part 'interior_state.dart';

class InteriorBloc extends Bloc<InteriorEvent, InteriorState> {
  InteriorBloc()
      : super(InteriorInitial(
          newmpty: [],
          serviceNamemap: {},
        )) {
    on<InteriorEnableButtonPressed>(interiorenablebuttonpressed);
    on<InteriorServiceAddingButtonPressed>(interiorserviceaddingbuttonpressed);
  }
  interiorenablebuttonpressed(
      InteriorEnableButtonPressed event, Emitter<InteriorState> emit) {
    List<String> servicestoring = [...state.newmpty];
    if (servicestoring.contains(event.serviceName)) {
      print('nadakoolaa in interior');
      servicestoring.remove(event.serviceName);
      emit(InteriorServiceremove(
          newmpty: servicestoring, serviceNamemap: state.serviceNamemap));
    } else {
      servicestoring.add(event.serviceName);
      emit(
        InteriorEnableBUttonValueAdded(
          newmpty: servicestoring,
          serviceNamemap: state.serviceNamemap,
        ),
      );
    }
  }

  interiorserviceaddingbuttonpressed(
      InteriorServiceAddingButtonPressed event, Emitter<InteriorState> emit) {
    try {
      Map<String, dynamic> cardTexts = {};
      if (cardTexts.containsKey(event.newservicename)) {
        print('value already exists');
      } else {
        print('worked');
        cardTexts.putIfAbsent(event.newservicename, () => event.rate);
        state.serviceNamemap.addAll(cardTexts);
        emit(InteriorInitial(
          newmpty: state.newmpty,
          serviceNamemap: state.serviceNamemap,
        ));
      }
    } catch (error, stackTrace) {
      print('Error occurred: $error');
      print('Stack trace: $stackTrace');
    }
  }
}

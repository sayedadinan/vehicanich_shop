import 'package:bloc/bloc.dart';
part 'interior_event.dart';
part 'interior_state.dart';

class InteriorBloc extends Bloc<InteriorEvent, InteriorState> {
  InteriorBloc()
      : super(InteriorInitial(
          servicesList: [],
          newmpty: [],
        )) {
    on<InteriorEnableButtonPressed>(interiorenablebuttonpressed);
    on<InteriorServiceAddingButtonPressed>(interiorserviceaddingbuttonpressed);
  }
  interiorenablebuttonpressed(
      InteriorEnableButtonPressed event, Emitter<InteriorState> emit) {
    // List<String> servicestoring = [...state.newmpty];
    // if (servicestoring.contains(event.serviceName)) {
    //   print('nadakoolaa in interior');
    //   servicestoring.remove(event.serviceName);
    //   emit(InteriorServiceremove(
    //       newmpty: servicestoring, serviceNamemap: state.serviceNamemap));
    // } else {
    //   servicestoring.add(event.serviceName);
    //   emit(
    //     InteriorEnableBUttonValueAdded(
    //       servicesList: state.servicesList,
    //       newmpty: servicestoring,
    //       serviceNamemap: state.serviceNamemap,
    //     ),
    //   );
    // }
  }

  interiorserviceaddingbuttonpressed(
      InteriorServiceAddingButtonPressed event, Emitter<InteriorState> emit) {
    state.servicesList.addAll(event.Selectedservices);
    emit(InteriorInitial(
      servicesList: state.servicesList,
      newmpty: state.newmpty,
    ));
  }
}

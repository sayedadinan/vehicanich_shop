import 'package:bloc/bloc.dart';

part 'emergency_event.dart';
part 'emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  EmergencyBloc()
      : super(EmergencyInitial(newmpty: [], serviceNameList: [
          'tire replacement',
          'battery jumpstart',
          'towing service',
          'body trim repair'
        ])) {
    on<EmergencymaintaincePressed>(emergencycontainerpressed);
    on<EmergencyEnableButtonPressed>(emergencyenablebuttonpressed);
    on<EmergencyServiceAddingButtonPressed>(emergencyserviceaddingbutton);
  }
  emergencycontainerpressed(
      EmergencymaintaincePressed event, Emitter<EmergencyState> emit) {
    emit(NavigatetoEmergencyservice(
        serviceNameList: state.serviceNameList, newmpty: state.newmpty));
  }

  emergencyenablebuttonpressed(
      EmergencyEnableButtonPressed event, Emitter<EmergencyState> emit) {
    List<String> servicestoring = [...state.newmpty];
    if (servicestoring.contains(event.serviceName)) {
      print('nadakoolaa');
      servicestoring.remove(event.serviceName);
      emit(EmergencyServiceremove(
          newmpty: servicestoring, serviceNameList: state.serviceNameList));
    } else {
      servicestoring.add(event.serviceName);
      emit(
        EmergencyEnableBUttonValueAdded(
          newmpty: servicestoring,
          serviceNameList: state.serviceNameList,
        ),
      );
    }
  }

  emergencyserviceaddingbutton(
      EmergencyServiceAddingButtonPressed event, Emitter<EmergencyState> emit) {
    List<String> cardTexts = [];
    if (cardTexts.contains(event.newservicename)) {
      print('value already exist');
    } else {
      cardTexts.add(event.newservicename);
      state.serviceNameList.addAll(cardTexts);
      emit(EmergencyInitial(
        newmpty: state.newmpty,
        serviceNameList: state.serviceNameList,
      ));
    }
  }
}

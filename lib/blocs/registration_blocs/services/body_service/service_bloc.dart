import 'package:bloc/bloc.dart';
part 'service_event.dart';
part 'service_state.dart';

class BodyBloc extends Bloc<ServiceEvent, ServiceState> {
  BodyBloc()
      : super(ServiceInitial(
          servicenameandrate: {'dd': 2},
          serviceNamemap: {},
          newmpty: [],
        )) {
    on<BodymaintaincePressed>(bodimaintainbuttonpressed);
    on<BodyEnableButtonPressed>(bodyenablebuttonpressed);
    on<BodyServiceAddingButtonPressed>(serviceaddingbuttonpressed);
    on<AddServiceWithRate>(addservicewithrate);
  }
  bodimaintainbuttonpressed(
      BodymaintaincePressed event, Emitter<ServiceState> emit) {
    emit(NavigatetoBodyservice(
        serviceNamemap: state.serviceNamemap,
        servicenameandrate: state.servicenameandrate,
        newmpty: state.newmpty));
  }

  bodyenablebuttonpressed(
      BodyEnableButtonPressed event, Emitter<ServiceState> emit) {
    List<String> servicestoring = [...state.newmpty];
    if (servicestoring.contains(event.serviceName)) {
      print('nadakoolaa');
      servicestoring.remove(event.serviceName);
      emit(BodyServiceremove(
          servicenameandrate: state.servicenameandrate,
          newmpty: servicestoring,
          serviceNamemap: state.serviceNamemap));
    } else {
      servicestoring.add(event.serviceName);
      emit(
        BodyEnableBUttonValueAdded(
          servicenameandrate: state.servicenameandrate,
          newmpty: servicestoring,
          serviceNamemap: state.serviceNamemap,
        ),
      );
    }
  }

  serviceaddingbuttonpressed(
      BodyServiceAddingButtonPressed event, Emitter<ServiceState> emit) {
    Map<String, dynamic> cardTexts = {};
    if (cardTexts.containsKey(event.newservicename)) {
      print('value already exist');
    } else {
      cardTexts.putIfAbsent(event.newservicename, () => event.serviceRate);
      print('Value added for key ${event.newservicename}');
      // cardTexts.add(event.newservicename);
      state.serviceNamemap.addAll(cardTexts);
      emit(ServiceInitial(
        servicenameandrate: state.servicenameandrate,
        newmpty: state.newmpty,
        serviceNamemap: state.serviceNamemap,
      ));
    }
  }

  addservicewithrate(AddServiceWithRate event, Emitter<ServiceState> emit) {
    print('this also worked');
    final updateMap = {...state.servicenameandrate};
    updateMap[event.serviceName] = event.rate;
    print(updateMap);
    emit(ServiceInitial(
        serviceNamemap: state.serviceNamemap,
        newmpty: state.newmpty,
        servicenameandrate: updateMap));
  }
}
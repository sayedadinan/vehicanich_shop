import 'package:bloc/bloc.dart';
part 'service_event.dart';
part 'service_state.dart';

class BodyBloc extends Bloc<ServiceEvent, ServiceState> {
  BodyBloc()
      : super(ServiceInitial(
          servicesList: [],
          servicenameandrate: {'dd': 2},
          newmpty: [],
        )) {
    on<BodymaintaincePressed>(bodimaintainbuttonpressed);
    on<BodyEnableButtonPressed>(bodyenablebuttonpressed);
    on<BodyServiceAddingButtonPressed>(serviceaddingbuttonpressed);
    // on<AddServiceWithRate>(addservicewithrate);
  }
  bodimaintainbuttonpressed(
      BodymaintaincePressed event, Emitter<ServiceState> emit) {
    emit(NavigatetoBodyservice(
        servicesList: state.servicesList,
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
        servicesList: state.servicesList,
        servicenameandrate: state.servicenameandrate,
        newmpty: servicestoring,
      ));
    } else {
      servicestoring.add(event.serviceName);
      emit(
        BodyEnableBUttonValueAdded(
          servicesList: state.servicesList,
          servicenameandrate: state.servicenameandrate,
          newmpty: servicestoring,
        ),
      );
    }
  }

  serviceaddingbuttonpressed(
      BodyServiceAddingButtonPressed event, Emitter<ServiceState> emit) {
    print('worked');
    if (state.servicesList.length >= 10) {
      print('we cant add');
    } else {
      state.servicesList.addAll(event.Selectedservices);
      print('successfully added ${state.servicesList}');
      emit(ServiceInitial(
        servicesList: state.servicesList,
        servicenameandrate: state.servicenameandrate,
        newmpty: state.newmpty,
      ));
    }
  }
}

  // addservicewithrate(AddServiceWithRate event, Emitter<ServiceState> emit) {
  //   print('this also worked');
  //   final updateMap = {...state.servicenameandrate};
  //   updateMap[event.serviceName] = event.rate;
  //   print(updateMap);
  //   emit(ServiceInitial(
  //       serviceNamemap: state.serviceNamemap,
  //       newmpty: state.newmpty,
  //       servicenameandrate: updateMap));
  // }


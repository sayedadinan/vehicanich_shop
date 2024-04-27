import 'package:bloc/bloc.dart';

part 'engine_event.dart';
part 'engine_state.dart';

class EngineBloc extends Bloc<EngineEvent, EngineState> {
  EngineBloc() : super(EngineInitial(newmpty: [], serviceNamemap: {})) {
    on<EngineEnableButtonPressed>(engineenablebuttonpressed);
    on<EngineServiceAddingButtonPressed>(engineserviceaddingbuttonpressed);
  }
  engineenablebuttonpressed(
      EngineEnableButtonPressed event, Emitter<EngineState> emit) {
    List<String> servicestoring = [...state.newmpty];
    if (servicestoring.contains(event.serviceName)) {
      print('nadakoolaa');
      servicestoring.remove(event.serviceName);
      emit(EngineServiceremove(
          newmpty: servicestoring, serviceNamemap: state.serviceNamemap));
    } else {
      servicestoring.add(event.serviceName);
      emit(
        EngineEnableBUttonValueAdded(
          newmpty: servicestoring,
          serviceNamemap: state.serviceNamemap,
        ),
      );
    }
  }

  engineserviceaddingbuttonpressed(
      EngineServiceAddingButtonPressed event, Emitter<EngineState> emit) {
    Map<String, dynamic> cardTexts = {};
    if (cardTexts.containsKey(event.newservicename)) {
      print('value already exist');
    } else {
      cardTexts.putIfAbsent(event.newservicename, () => event.rate);
      state.serviceNamemap.addAll(cardTexts);
      emit(EngineInitial(
        newmpty: state.newmpty,
        serviceNamemap: state.serviceNamemap,
      ));
    }
  }
}

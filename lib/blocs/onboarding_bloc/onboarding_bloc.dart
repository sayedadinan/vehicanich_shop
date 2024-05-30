import 'package:bloc/bloc.dart';
import 'package:vehicanich_shop/data/repositories/shop_id_service.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingblocEvent, OnboardingBlocState> {
  OnboardingBloc() : super(Initialblocstate()) {
    on<NextButtonPressed>(nextButtonPressed);
    on<LoginButtonPressed>(loginButtonPressed);
    on<Signinbuttonpressed>(signinButtonPressed);
  }
  nextButtonPressed(
      NextButtonPressed event, Emitter<OnboardingBlocState> emit) async {
    if (event.page == 0) {
      emit(NavigatetosecondOnboardingPage());
    } else if (event.page == 1) {
      await SharedPreferencesService().userFirstTimeOrNot(true);
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setBool(Referencekeys.initialEntry, true);
      emit(NavigatetoLoginorSignPage());
    }
  }

  loginButtonPressed(
      LoginButtonPressed event, Emitter<OnboardingBlocState> emit) {
    emit(NavigatetoLoginPage());
  }

  signinButtonPressed(
      Signinbuttonpressed event, Emitter<OnboardingBlocState> emit) {
    emit(Navigatetosignpage());
  }
}

import 'package:bloc/bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial(query: '')) {
    on<SearchValueAdded>(searchValue);
  }
  searchValue(SearchValueAdded event, Emitter<SearchState> emit) {
    emit(SearchInitial(query: event.value));
  }
}

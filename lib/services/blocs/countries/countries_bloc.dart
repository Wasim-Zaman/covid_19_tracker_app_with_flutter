import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/countries_repository.dart';

import './countries_events.dart';
import './countries_states.dart';

class CountriesBloc extends Bloc<CountriesEvents, CountriesStates> {
  final CountriesRepository countriesRepository;
  CountriesBloc(this.countriesRepository) : super(CountriesLoadingState()) {
    on<ExceptionEvent>((event, emit) {
      emit(CountriesExceptionState(event.message));
    });
    on<LoadingEvent>((event, emit) async {
      emit(CountriesLoadingState());
      try {
        print('Data is loading...');
        final countriesModel = await countriesRepository.fetchCountriesData();
        print('Data is loaded...');
        emit(CountriesLoadedState(countriesModel));
      } catch (error) {
        add(ExceptionEvent(error.toString()));
      }
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/countries_repository.dart';
import './countries_events.dart';
import './countries_states.dart';
import '../../../models/countries_model.dart';

class CountriesBLoc extends Bloc<CountriesEvents, CountriesStates> {
  final CountriesRepository countriesRepository;
  CountriesBLoc(this.countriesRepository) : super(CountriesLoadingState()) {
    on<ExceptionEvent>((event, emit) {
      emit(CountriesExceptionState(event.message));
    });
    on<LoadingEvent>((event, emit) async {
      emit(CountriesLoadingState());
      try {
        print('Data is loading...');
        final countriesList = await countriesRepository.fetchCountriesList();
        print('Data is loaded...');
        emit(CountriesLoadedState(countriesList));
      } catch (error) {
        add(ExceptionEvent(error.toString()));
      }
    });
  }
}

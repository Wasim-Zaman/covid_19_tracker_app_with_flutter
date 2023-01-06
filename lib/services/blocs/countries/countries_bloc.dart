import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/countries_repository.dart';
import './countries_events.dart';
import './countries_states.dart';

class CountriesBLoc extends Bloc<CountriesEvents, CountriesStates> {
  final CountriesRepository countriesRepository;
  CountriesBLoc(this.countriesRepository) : super(InitialState()) {
    on<ExceptionEvent>((event, emit) {
      emit(CountriesExceptionState(event.message));
    });
    on<LoadingEvent>((event, emit) async {
      try {
        emit(CountriesLoadingState(
            await countriesRepository.fetchCountriesList()));
      } catch (error) {
        print('error');
      }
      try {
        final countriesList = await countriesRepository.fetchCountriesList();
        emit(CountriesLoadedState(countriesList));
      } catch (error) {
        add(ExceptionEvent(error.toString()));
      }
    });

    on<SearchEvent>((event, emit) async {
      try {
        final countriesList = await countriesRepository.fetchCountriesList();

        if (event.query.isEmpty) {
          emit(CountriesLoadedState(countriesList));
          return;
        } else if (countriesList.any((element) => element.country!
            .toLowerCase()
            .contains(event.query.toLowerCase()))) {
          final filteredCountriesList = countriesList.firstWhere((element) =>
              element.country!
                  .toLowerCase()
                  .contains(event.query.toLowerCase()));
          emit(CountriesLoadedState([filteredCountriesList]));
        } else {
          emit(CountriesLoadedState([]));
        }

        // final filteredCountriesList = countriesList.firstWhere((element) =>
        //     element.country!.toLowerCase().contains(event.query.toLowerCase()));
        // emit(CountriesLoadedState([filteredCountriesList]));
      } catch (error) {
        add(ExceptionEvent(error.toString()));
      }
    });
  }
}

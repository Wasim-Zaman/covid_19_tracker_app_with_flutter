// ignore_for_file: non_constant_identifier_names

import '../../../models/countries_model.dart';

abstract class CountriesStates {}

class CountriesLoadedState extends CountriesStates {
  final List<CountriesModel> countriesModel;
  CountriesLoadedState(this.countriesModel);
}

class CountriesExceptionState extends CountriesStates {
  final String message;
  CountriesExceptionState(this.message);
}

class CountriesLoadingState extends CountriesStates {
  final List<CountriesModel> countriesModel;
  CountriesLoadingState(this.countriesModel);
}

class ErrorState extends CountriesStates {}

class InitialState extends CountriesStates {}

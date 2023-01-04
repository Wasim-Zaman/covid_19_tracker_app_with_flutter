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
  final String LoadingMessage;
  CountriesLoadingState({this.LoadingMessage = 'Loading...'});
}

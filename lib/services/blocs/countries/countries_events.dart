abstract class CountriesEvents {}

class ExceptionEvent extends CountriesEvents {
  final String message;
  ExceptionEvent(this.message);
}

class LoadingEvent extends CountriesEvents {}

class LoadedEvent extends CountriesEvents {}

class SearchEvent extends CountriesEvents {
  final String query;
  SearchEvent(this.query);
}

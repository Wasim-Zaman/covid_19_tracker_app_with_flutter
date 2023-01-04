abstract class StatesEvents {}

class ExceptionEvent extends StatesEvents {
  final String message;
  ExceptionEvent(this.message);
}

class LoadingEvent extends StatesEvents {}

class LoadedEvent extends StatesEvents {}

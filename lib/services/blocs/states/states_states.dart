import '../../../models/states_model.dart';
import '../../../models/countries_model.dart';

abstract class StatesStates {}

class ExceptionState extends StatesStates {
  final String message;
  ExceptionState(this.message);
}

class LoadingState extends StatesStates {
  final String LoadingMessage;
  LoadingState({this.LoadingMessage = 'Loading...'});
}

class LoadedState extends StatesStates {
  final StatesModel stateModel;
  LoadedState(this.stateModel);
}

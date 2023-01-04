import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/states_repository.dart';
import 'states_events.dart';
import 'states_states.dart';

class StatesBloc extends Bloc<StatesEvents, StatesStates> {
  final StatesRepository statesRepository;
  StatesBloc(this.statesRepository) : super(LoadingState()) {
    on<ExceptionEvent>((event, emit) {
      emit(ExceptionState(event.message));
    });
    on<LoadingEvent>((event, emit) async {
      emit(LoadingState());
      try {
        print('Data is loading...');
        final stateModel = await statesRepository.fetchWorldStatesRecord();
        print('Data is loaded...');
        emit(LoadedState(stateModel));
      } catch (error) {
        add(ExceptionEvent(error.toString()));
      }
    });
    // on<LoadedEvent>((event, emit) {
    //   final stateModel = statesRepository.fetchWorldStatesRecord();
    //   emit(LoadedState(stateModel as StatesModel));
    // });
  }
}

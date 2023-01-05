import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/states_repository.dart';
import 'states_events.dart';
import 'states_states.dart';
// import '../../../models/states_model.dart';

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
        final statesModel = await statesRepository.fetchStatesData();
        print('Data is loaded...');
        emit(LoadedState(statesModel));
      } catch (error) {
        print('***** error: $error *****');
        add(ExceptionEvent(error.toString()));
      }
    });
  }
}

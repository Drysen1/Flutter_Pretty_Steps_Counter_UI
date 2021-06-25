import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_event.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_state.dart';
import 'package:flutter_pretty_steps_counter_ui/models/stepsInformationModel.dart';
import 'package:flutter_pretty_steps_counter_ui/repository/stepsRepository.dart';

class StepsCounterBloc extends Bloc<StepsCounterEvent, StepsCounterState>{
  StepsCounterBloc() : super(StepsCounterInitialState());
  late StepsInformationModel _currentStepsInformation;
  List<StepsInformationModel> _steps = [];


  @override
  Stream<StepsCounterState> mapEventToState(StepsCounterEvent event) async*{
    if(event is InitializeEvent){
      yield* _mapInitializeEventToState(event);
    } else if(event is DayChangeEvent){
      yield* _mapDayChangeEventToState(event);
    }
  }

  Stream<StepsCounterState> _mapInitializeEventToState(InitializeEvent event) async *{
    _steps = _getSteps();
    _currentStepsInformation = _steps[_steps.length - 1];
    yield StepsLoadedState(_steps, _currentStepsInformation);
  }

  Stream<StepsCounterState> _mapDayChangeEventToState(DayChangeEvent event) async *{
    yield DayChangingState();
    _currentStepsInformation = _steps[event.index];
    yield DayChangedState(_currentStepsInformation);
  }

  List<StepsInformationModel> _getSteps(){
    var stepsRepository = StepsRepository();
    return stepsRepository.getSteps();
  }
}
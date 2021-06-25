import 'package:equatable/equatable.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_event.dart';
import 'package:flutter_pretty_steps_counter_ui/models/stepsInformationModel.dart';

class StepsCounterState extends Equatable{
  const StepsCounterState();
  @override
  List<Object?> get props => [];
}

class StepsCounterInitialState extends StepsCounterState{}

class StepsLoadedState extends StepsCounterState{
  final List<StepsInformationModel> steps;
  final StepsInformationModel currentStepInformation;
  StepsLoadedState(this.steps, this.currentStepInformation);
}

class DayChangingState extends StepsCounterState{}

class DayChangedState extends StepsCounterState{
  final StepsInformationModel currentStepInformation;
  DayChangedState(this.currentStepInformation);
}
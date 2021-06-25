import 'package:equatable/equatable.dart';

class StepsCounterEvent extends Equatable{
  const StepsCounterEvent();
  @override
  List<Object?> get props => [];
}

class InitializeEvent extends StepsCounterEvent{}

class DayChangeEvent extends StepsCounterEvent{
  final int index;
  DayChangeEvent(this.index);
}
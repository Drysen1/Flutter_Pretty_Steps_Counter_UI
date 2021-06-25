import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_state.dart';

import 'animatedCircularIndicator.dart';

class StepsIndicator extends StatefulWidget {
  const StepsIndicator({ Key? key }) : super(key: key);

  @override
  _StepsIndicatorState createState() => _StepsIndicatorState();
}

class _StepsIndicatorState extends State<StepsIndicator> {

  double _calculateEndValue(int currenSteps, int goalSteps){
    var endValue = (currenSteps / goalSteps);
    return endValue;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepsCounterBloc, StepsCounterState>(
      buildWhen: (oldState, newState){
        return newState is StepsLoadedState ||
        newState is DayChangedState;
      },
      builder: (context, state){
        var currentStepCount = "0";
        var goalSteps = "0";
        var endValue = 0.0;
        if(state is StepsLoadedState){
          currentStepCount = state.currentStepInformation.totalSteps.toString();
          goalSteps = state.currentStepInformation.goal.toString();
          endValue = _calculateEndValue(state.currentStepInformation.totalSteps, state.currentStepInformation.goal);
        }

        if(state is DayChangedState){
          currentStepCount = state.currentStepInformation.totalSteps.toString();
          goalSteps = state.currentStepInformation.goal.toString();
          endValue = _calculateEndValue(state.currentStepInformation.totalSteps, state.currentStepInformation.goal);
        }

        return Container(
          width: 300,
          height: 300,
          child: Stack(children: [
            AspectRatio(
              aspectRatio: 1,
              child: AnimatedCircularIndicator(endvalue: endValue),
              ),
              _amountOfStepsText(currentStepCount, goalSteps)
            ],
          )
        );
      }
    );
  }

  Widget _amountOfStepsText(String currentStepCount, String goalSteps){
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _currentStepCountText(currentStepCount),
          _goalStepsText(goalSteps)
        ],
      ))
    );
  }

  Widget _currentStepCountText(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 42,
        letterSpacing: 2,
        fontWeight: FontWeight.w300,
        color: Colors.white,
      ),
    );
  }

  Widget _goalStepsText(String text){
    return Text(
      "of $text",
      style: TextStyle(
        fontSize: 20,
        letterSpacing: 2,
        fontWeight: FontWeight.w300,
        color: Colors.white70,
      )
    );
  }
}
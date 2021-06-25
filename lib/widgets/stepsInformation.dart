import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_state.dart';

class StepesInformation extends StatefulWidget {
  const StepesInformation({ Key? key }) : super(key: key);

  @override
  _StepesInformationState createState() => _StepesInformationState();
}

class _StepesInformationState extends State<StepesInformation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepsCounterBloc, StepsCounterState>(
      buildWhen: (oldState, newState){
        return newState is StepsLoadedState ||
        newState is DayChangedState;
      },
      builder: (context, state){
        var calories = "";
        var avarageSpeed = "";
        var distance = "";
        if(state is StepsLoadedState){
          calories = state.currentStepInformation.kcal.toString();
          avarageSpeed = state.currentStepInformation.avarageSpeed.toString();
          distance = state.currentStepInformation.distance.toString();
        }

        if(state is DayChangedState){
          calories = state.currentStepInformation.kcal.toString();
          avarageSpeed = state.currentStepInformation.avarageSpeed.toString();
          distance = state.currentStepInformation.distance.toString();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _stepsInformation("Calories", calories, "Kcal"),
            _stepsInformation("Speed Avg.", avarageSpeed, "Kph"),
            _stepsInformation("Distance", distance, "Km")
          ],
        );
      }
    );
  }

  Widget _stepsInformation(String title, String value, String subtitle){
    return Container(
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          _infoText(title),
          SizedBox(height: 10,),
          _infoValueText(value),
          SizedBox(height: 10,),
          _infoText(subtitle)
        ],
      )
    );
  }

  Widget _infoValueText(String text){
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _infoText(String text){
    return Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 14
      ),
    );
  }
}
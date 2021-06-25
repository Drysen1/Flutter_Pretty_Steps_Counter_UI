import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_event.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_state.dart';
import 'package:flutter_pretty_steps_counter_ui/models/stepsInformationModel.dart';

class DaysButtons extends StatefulWidget {
  const DaysButtons({ Key? key }) : super(key: key);

  @override
  _DaysButtonsState createState() => _DaysButtonsState();
}

class _DaysButtonsState extends State<DaysButtons> {
  List<bool> _selections = List.generate(5, (_) => false);
  int _sortIndex = 4;

  void setSelectedToggleButton(int index){
    setState(() {         
      _sortIndex = index;
      for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
        if (buttonIndex == index) {
          _selections[buttonIndex] = true;
        } else {
          _selections[buttonIndex] = false;
        }
      }
    });
  }

  List<Widget> _getDayButtons(List<StepsInformationModel> steps){
    List<Widget> dayButtons = [];
    var sortIndex = 0;
    for(var stepInfo in steps){
      dayButtons.add(_dayButton(stepInfo.shortDayName, stepInfo.date, sortIndex));
      sortIndex++;
    }
    return dayButtons;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepsCounterBloc, StepsCounterState>(
      buildWhen: (oldState, newState){
        return newState is StepsLoadedState;
      },
      builder: (context, state){
        if(state is StepsLoadedState){
          return ToggleButtons(
            fillColor: Colors.transparent,
            renderBorder: false,
            isSelected: _selections,
            children: _getDayButtons(state.steps),
            onPressed: (int index) {
              setSelectedToggleButton(index);
              context.read<StepsCounterBloc>().add(DayChangeEvent(index));
            },
          );
        } else{
          return Container(width: 10,);
        }
      }
    );
  }

  Widget _dayButton(String dayShortName, String date, int sortIndex){
    return Container(
      width: 70,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _dayShortNameText(dayShortName),
          SizedBox(height: 5,),
          _dateText(date),
          SizedBox(height: 7),
          _sortIndex == sortIndex ? _selectedBar() : Container()
        ],
      ),
    );
  }

  Widget _dayShortNameText(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }

  Widget _dateText(String text){
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _selectedBar(){
    return Container(
      color: Colors.white,
      width: 35,
      height: 3,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_event.dart';
import 'package:flutter_pretty_steps_counter_ui/widgets/daysButtons.dart';
import 'package:flutter_pretty_steps_counter_ui/widgets/stepsIndicator.dart';
import 'package:flutter_pretty_steps_counter_ui/widgets/stepsInformation.dart';
import 'package:flutter_pretty_steps_counter_ui/widgets/userAppbarAction.dart';

class StepsCounterScreen extends StatefulWidget {
  const StepsCounterScreen({ Key? key }) : super(key: key);

  @override
  _StepsCounterScreenState createState() => _StepsCounterScreenState();
}

class _StepsCounterScreenState extends State<StepsCounterScreen> {
  late StepsCounterBloc _stepsCounterBloc;

  @override
  void initState() {
    _stepsCounterBloc = BlocProvider.of<StepsCounterBloc>(context);
    _stepsCounterBloc.add(InitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 188,78,156),
                  Color.fromARGB(255, 248,7,89)]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          actions: [
            UserAppbarAction(),
            Spacer()
          ],
        ),
        body: _body(),
      )
    );
  }

  Widget _body(){
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Center( child: DaysButtons(),),
              SizedBox(height: 60,),
              StepsIndicator(),
              SizedBox(height: 60,),
              StepesInformation()
            ],
          )
        )
      )
    );
  }
}
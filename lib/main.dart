import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/blocs/steps_counter_bloc.dart';
import 'package:flutter_pretty_steps_counter_ui/screens/stepsCounterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Steps Counter UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => StepsCounterBloc(),
        child: StepsCounterScreen(),
      ) 
    );
  }
}
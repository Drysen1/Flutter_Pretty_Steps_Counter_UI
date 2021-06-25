import 'package:flutter_pretty_steps_counter_ui/models/stepsInformationModel.dart';

class StepsRepository{
  List<StepsInformationModel> getSteps(){
    List<StepsInformationModel> steps = [];
    steps.add(StepsInformationModel(0, "Mon", "29", 6000, 900, 7.2, 7.2, 6000));
    steps.add(StepsInformationModel(0, "Tue", "30", 4320, 740, 6.8, 4.5, 6000));
    steps.add(StepsInformationModel(0, "Wed", "1", 8473, 1500, 7.1, 10, 6000));
    steps.add(StepsInformationModel(0, "Thu", "2", 2430, 400, 6.5, 2.1, 6000));
    steps.add(StepsInformationModel(0, "Fri", "3", 5488, 850, 7.3, 6.1, 6000));
    return steps;
  }
}
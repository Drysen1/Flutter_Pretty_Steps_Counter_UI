import 'package:flutter/material.dart';

class CircularIndicator extends StatefulWidget {
  final double value;
  const CircularIndicator({ Key? key, required this.value }) : super(key: key);

  @override
  _CircularIndicatorState createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return  CircularProgressIndicator(
      value: this.widget.value,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      backgroundColor: Colors.white12,
      strokeWidth: 8,
    );
  }
}
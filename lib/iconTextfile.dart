import 'package:bmi_calculator/constantfile.dart';
import 'package:flutter/material.dart';
import 'constantfile.dart';
class RepeatTextandIcon extends StatelessWidget {
  RepeatTextandIcon({required this.iconDate, required this.label});
  final IconData iconDate;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconDate,
          size: 50.0,
        ),
        SizedBox(height: 15.0,),
        Text(label,style: kLabelStyle,)



      ],
    );
  }
}
import 'package:flutter/material.dart';
class RepeatContainercode extends StatelessWidget {

  RepeatContainercode({required this.colors, required this.cardWidget, });

  final Color colors;
  final Widget cardWidget;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardWidget,
      decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
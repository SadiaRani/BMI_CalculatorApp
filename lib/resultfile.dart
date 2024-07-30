import 'package:bmi_calculator/Containerfile.dart';
import 'package:bmi_calculator/constantfile.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class Resultfile extends StatelessWidget {
  Resultfile({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget> [
          Expanded(child: Container(
            child: Center(
              child: Text('Your Result',style: kTitleStylesS2,),
            ),
          )),
          Expanded(
              flex: 5,
          child: RepeatContainercode(
            colors: activeColor,
            cardWidget:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText,style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                Text(bmiResult,style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold),),
                Text(interpretation ,  textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold), ),

              ],
            ) ,)),
          Expanded(child: Container(
            color: Color(0xFFEB1555),
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            height: 80.0,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context)=> InputPage()));
              },
              child: Text(
                'ReCalculate',
                style: kLargeButtonStyle,
              ),
            ),
          ),)

        ],
      )
    );
  }
}

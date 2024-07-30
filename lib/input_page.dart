import 'package:bmi_calculator/constantfile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconTextfile.dart';
import 'Containerfile.dart';
import 'constantfile.dart';
import 'resultfile.dart';
import 'calculatefile.dart';

enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectGender;
  int sliderHeight = 180;
  int sliderWeight = 60;
  int sliderAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    child: RepeatContainercode(
                      colors: selectGender == Gender.male ? activeColor : deActiveColor,
                      cardWidget: RepeatTextandIcon(
                        iconDate: Icons.male,
                        label: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    child: RepeatContainercode(
                      colors: selectGender == Gender.female ? activeColor : deActiveColor,
                      cardWidget: RepeatTextandIcon(
                        iconDate: Icons.female,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RepeatContainercode(
              colors: Color(0xFF1D1E33),
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kLabelStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(sliderHeight.toString(), style: kNumberStyle),
                      Text("cm", style: kLabelStyle),
                    ],
                  ),
                  Slider(
                    value: sliderHeight.toDouble(),
                    min: 120.0,
                    max: 200,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderHeight = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RepeatContainercode(
                    colors: Color(0xFF1D1E33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelStyle),
                        Text(sliderWeight.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                               iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  sliderWeight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIcon(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  sliderWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: RepeatContainercode(
                    colors: Color(0xFF1D1E33),
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelStyle),
                        Text(sliderAge.toString(), style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              iconData: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  sliderAge--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIcon(
                              iconData: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  sliderAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Color(0xFFEB1555),
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              height: 80.0,
              child: TextButton(
                onPressed: () {
                  CalculatorBrain calcul = CalculatorBrain(height: sliderHeight,weight: sliderWeight );
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Resultfile(
                   bmiResult: calcul.calculatBMI(),
                   resultText: calcul.getresult(),
                   interpretation: calcul.getinterpretation(),
                 )));

                },
                child: Text(
                  'Calculate',
                  style: kLargeButtonStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({required this.iconData, required this.onPressed});
  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      child: Icon(iconData),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

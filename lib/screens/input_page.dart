import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reuseable_card.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';

import '../widgets/bottom_button.dart';
import 'results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour;
  Color femaleCardColour;
  Gender selectedGender;
//  double value = 170;
  double height = 184;
  int weight = 80;
  int age = 27;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Container(
        color: Color(0xFF0C1234),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: maleCardColour = selectedGender == Gender.male
                          ? kMyCardColor
                          : kInactiveCardColor,
                      myMargin: EdgeInsets.fromLTRB(20, 20, 5, 20),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: femaleCardColour = selectedGender == Gender.female
                          ? kMyCardColor
                          : kInactiveCardColor,
                      myMargin: EdgeInsets.fromLTRB(5, 20, 20, 20),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.female,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kMyCardColor,
                myMargin: EdgeInsets.symmetric(horizontal: 20),
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Text(
                        'HEIGHT',
                        style: TextStyle(
                          color: Color(0xFF8E8E99),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toInt().toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: kMyCalculateColor,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        min: 120.0,
                        max: 220.0,
//                      label: height,
                        divisions: 100,
                        value: height,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      colour: kMyCardColor,
                      myMargin: EdgeInsets.fromLTRB(20, 20, 5, 17.5),
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Color(0xFF8E8E99),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      colour: kMyCardColor,
                      myMargin: EdgeInsets.fromLTRB(5, 20, 20, 17.5),
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'AGE',
                              style: TextStyle(
                                color: Color(0xFF8E8E99),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 15),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              title: 'CALCULATE YOUR BMI',
              onTap: () {
                BmiBrain bmiBrain = BmiBrain(height: height, weight: weight);
                bmiBrain.calculateBmi();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      feedbackKeys: bmiBrain.getFeedbackKeys(),
                      bmiResultNum: bmiBrain.getBmi(),
                      feedback: bmiBrain.getFeedback(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

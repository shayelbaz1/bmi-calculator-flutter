import 'package:bmi_calculator/widgets/reuseable_card.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_button.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  final String feedbackKeys;
  final String bmiResultNum;
  final String feedback;
  ResultsPage({this.feedbackKeys, this.bmiResultNum, this.feedback});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kYourResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: kMyCardColor,
              myMargin: EdgeInsets.all(20.0),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        child: Text(
                          feedbackKeys,
                          style: TextStyle(
                            color: feedbackKeysColors(),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      bmiResultNum,
                      style: kBigNumberTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Normal BMI range:',
                          style: TextStyle(
                            color: Color(0xFF8E8E99),
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '18.5 - 25 kg',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      feedback,
                      style: TextStyle(
                        color: feedbackKeysColors(),
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Color feedbackKeysColors() {
    if (feedbackKeys == 'UNDERWEIGHT') {
      return Colors.lightBlueAccent;
    } else if (feedbackKeys == 'NORMAL') {
      return Colors.green;
    } else if (feedbackKeys == 'OVERWEIGHT') {
      return Colors.yellowAccent;
    } else {
      return Colors.red;
    }
  }
}

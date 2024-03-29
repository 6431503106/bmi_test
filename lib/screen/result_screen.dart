import 'package:bmi_test/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_test/components/bottom_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:bmi_test/screen/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bmi_test/components/resable_card2.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.nameResult,
      required this.interpretation,
      required this.bmiResult,
      required this.resultText});
  var nameResult;
  final String bmiResult;
  final String resultText;
  final String interpretation;
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
              padding: EdgeInsets.all(1.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                '$nameResult, your Result. ',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard2(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          BottomButton(
            buttonTitle: 'Note',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NoteList()));
            },
          ),
          ElevatedButton(
              onPressed: () {
                Share.share("Your BMI is ${bmiResult}");
              },
              child: const Text("Share")),
        ],
      ),
    );
  }
}

//main
import 'package:bmi_test/constants.dart';
import 'package:flutter/material.dart';
import 'welcome.dart';
import 'package:flutter/services.dart';
import 'package:bmi_test/screen/calculate_screen.dart';
import 'package:bmi_test/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen 1',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: kInactiveCardColour,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/work.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 100,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Your Name"),
                  style: kLabelTextStyle,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "This  calculator will also display your BMI",
                          style: kLabelTextStyle),
                    ],
                  ),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CalculatorScreen(
                            nameResult: nameController.text,
                          );
                        },
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kActiveCardColour,
                      ),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            "START LEARNING",
                            style: kLabelTextStyle,
                            selectionColor: Color.fromARGB(255, 0, 0, 0),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: kInactiveCardColour,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

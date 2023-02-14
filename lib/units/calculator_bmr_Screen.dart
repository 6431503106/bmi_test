import 'dart:math';
import 'calculator_screen.dart';
import 'package:flutter/material.dart';

class BmrLogic {
  BmrLogic({this.height, this.weight, this.age});
  List<DropdownMenuItem<String>> dropdownGenderList = [];
  List<DropdownMenuItem<String>> dropdownEquationList = [];
  List<DropdownMenuItem<String>> dropdownActivityList = [];
  List<String> dropdownGender = ["Female", "Male"];
  List<String> dropdownEquation = ["Mifflin-St Jeor", "Harris-Benedict"];
  List<String> dropdownActivity = [
    "I am sedentary",
    "I am lightly active",
    "I am moderately active",
    "I am very active",
    "I am super active"
  ];
  final int height;
  final int weight;
  final int age;
  void loadGender() {
    dropdownGenderList = [];
    dropdownGenderList = dropdownGender
        .map((values) => new DropdownMenuItem<String>(
              child: new Text(values),
              value: values,
            ))
        .toList();
  }

  void loadEquation() {
    dropdownEquationList = [];
    dropdownEquationList = dropdownEquation
        .map((values) => new DropdownMenuItem<String>(
              child: new Text(values),
              value: values,
            ))
        .toList();
  }

  void loadActivity() {
    dropdownActivityList = [];
    dropdownActivityList = dropdownActivity
        .map((values) => new DropdownMenuItem<String>(
              child: new Text(values),
              value: values,
            ))
        .toList();
  }

  String selected,
      selected1,
      selected2,
      genderController,
      equationController,
      activityController;
  int bmrTotal = 0, calories = 0;
  double bmrDouble = 0.0, caloriesDouble;

  double _bmr;

  String calculateBMI() {
    if (genderController == "Male") {
      if (equationController == "Mifflin-St Jeor") {
        bmrDouble = (4.536 * weight) + (15.88 * height) - (5 * age) + 5;
      } else if (equationController == "Harris-Benedict") {
        bmrDouble = 66.47 + (6.24 * weight) + (12.7 * height) - (6.755 * age);
      }
    } else if (genderController == "Female") {
      if (equationController == "Mifflin-St Jeor") {
        bmrDouble = (4.536 * weight) + (15.88 * height) - (5 * age) - 161;
      } else if (equationController == "Harris-Benedict") {
        bmrDouble = 655.1 + (4.35 * weight) + (4.7 * height) - (4.7 * age);
      }
    }
    bmrTotal = (bmrDouble.round());
    if (activityController == "I am sedentary") {
      caloriesDouble = (bmrTotal * 1.2);
    } else if (activityController == "I am lightly active") {
      caloriesDouble = (bmrTotal * 1.375);
    } else if (activityController == "I am moderately active") {
      caloriesDouble = (bmrTotal * 1.55);
    } else if (activityController == "I am very active") {
      caloriesDouble = (bmrTotal * 1.725);
    } else if (activityController == "I am super active") {
      caloriesDouble = (bmrTotal * 1.9);
    }
    calories = (caloriesDouble.round());
  }
}

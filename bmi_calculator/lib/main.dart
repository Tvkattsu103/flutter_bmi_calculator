// ignore_for_file: must_be_immutable, unnecessary_new, prefer_const_constructors, duplicate_ignore, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Your BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int myHeight = 0;
  int myWeight = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    TextField billAmountField = new TextField(
        decoration: new InputDecoration(
            labelText: "Height (cm)", hintText: "Enter your height..."),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          try {
            myHeight = int.parse(value.toString());
          } catch (exception) {
            myHeight = 0;
          }
        });

    // ignore: unnecessary_new
    TextField gstPercentageField = new TextField(
        decoration: new InputDecoration(
            labelText: "Weight (kg)", hintText: "Enter your weight..."),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          try {
            myWeight = int.parse(value.toString());
          } catch (exception) {
            myWeight = 0;
          }
        });

    RaisedButton calculateButton = new RaisedButton(
        child: new Text("Calculate"),
        color: Colors.red,
        onPressed: () {
          double h = (myHeight / 100);
          double total = myWeight / (h * h);
          String result = total.toStringAsFixed(2);

          String msg = "";

          if (total < 18.5) {
            msg = "Underweight";
          } else {
            if (total >= 18.5 && total <= 24.9) {
              msg = "Normal weight";
            } else {
              if (total >= 25 && total <= 29.9) {
                msg = "Overweight";
              } else {
                msg = "Obesity";
              }
            }
          }

          AlertDialog dialog = new AlertDialog(
              content: new Text("BMI: $result \n" "Result: $msg"));

          showDialog(context: context, builder: (context) => dialog);
        });

    // ignore: unnecessary_new
    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            children: [billAmountField, gstPercentageField, calculateButton]));
    AppBar appBar = new AppBar(title: new Text("Calculate Your BMI"));
    Scaffold scaffold = new Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}

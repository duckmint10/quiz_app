import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

final ThemeData _myTheme = _buildAppTheme();

TextTheme _builTextTheme(TextTheme base) {
  return base.copyWith(
    headline1: base.headline1.copyWith(
      fontWeight: FontWeight.w500
    ),
    headline6: base.headline6.copyWith(
      fontSize: 18,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14
    ),
    bodyText2: base.bodyText2.copyWith(
        fontSize: 17,
        color: Colors.red,
      fontFamily: "Inconsolata"
    ),
    button: base.button.copyWith(
      letterSpacing: 3,
      fontSize: 20
    )
  ).apply(
    fontFamily: "Inconsolata",
    displayColor: Colors.pinkAccent
  );
}

ThemeData _buildAppTheme() {
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    brightness: Brightness.dark,
    accentColor: Colors.amber,
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.blueAccent,
    backgroundColor: Colors.amber,
    textTheme: _builTextTheme(base.textTheme)
  );
}


void main() {
  runApp(new MaterialApp(
    theme: _myTheme,
    // theme: ThemeData(
    //   brightness: Brightness.dark,
    //   primaryColor: Colors.grey[800],
    //   textTheme: TextTheme(
    //     headline1: TextStyle(
    //       fontSize: 34, fontWeight: FontWeight.bold
    //     ),
    //     bodyText2: TextStyle(
    //       fontSize: 30
    //     )
    //   )
    // ),
    home:QuizApp(),
  ));
}

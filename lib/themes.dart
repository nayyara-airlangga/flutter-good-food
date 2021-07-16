import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey[800],
  primaryColorDark: Colors.grey[900],
  accentColor: Colors.white,
  canvasColor: Colors.black,
  fontFamily: 'Raleway',
  textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        bodyText2: TextStyle(
          color: Color.fromRGBO(20, 51, 51, 1),
        ),
        headline6: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
);

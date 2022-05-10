import 'package:flutter/material.dart';

const primaryColor = Colors.lime;
const secondaryColor = Colors.black;
const thirdColor = Colors.blueGrey;

final appTheme = ThemeData(
  primarySwatch: primaryColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'WorkSansSemiBold',
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: thirdColor,
    ),
  ),
);

import 'package:flutter/material.dart';

abstract class UITextStyles {
  const UITextStyles._();

  /// headlineH1
  static const TextStyle largeTitle = TextStyle(
    // fontFamily: 'Saira',
    fontWeight: FontWeight.bold,
    fontSize: 34,
    height: 41 / 34,
    letterSpacing: 0,
    color: Colors.white,
  );

  static const TextStyle title1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    height: 25 / 22,
    letterSpacing: 0,
    color: Colors.white,
  );

  static const TextStyle title2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    height: 28 / 22,
    letterSpacing: 0,
    color: Colors.white,
  );

  static const TextStyle hedline = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 22 / 17,
    letterSpacing: 0,
    color: Colors.white,
  );

  static const TextStyle body = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 22 / 22,
    letterSpacing: 0,
    color: Colors.white,
  );
}

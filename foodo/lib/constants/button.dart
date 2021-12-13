import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

class Buttons {
  static Widget Button(
      Color? color, double radius, double height, double width, String text) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: Center(
          child: Helper.text(text, 20, 0, Colors.white, FontWeight.bold)),
    );
  }
}

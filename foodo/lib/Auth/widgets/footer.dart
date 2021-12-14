import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

class BottomText {
  static Widget Footer(Color? color, String text) {
    return Center(child: Helper.text(text, 15, 0, color!, FontWeight.normal));
  }
}

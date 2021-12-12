import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helper {
  int radius = 10;
  int maxradius = 40;
  static Widget text(String msg, int size, int spacing, Color color, FontWeight fontWeight) {
    return Text(
      msg,
      textAlign: TextAlign.center,
      style: GoogleFonts.ubuntu(
          fontWeight: fontWeight,
          fontSize: size.toDouble(),
          color: color,
          letterSpacing: spacing.toDouble()),
    );
  }
}

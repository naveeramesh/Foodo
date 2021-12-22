import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helper {
  static Widget text(
      String msg, int size, int spacing, Color? color, FontWeight fontWeight, TextAlign align) {
    return Text(
      msg,
      textAlign: align,
      style: GoogleFonts.josefinSans(
          fontWeight: fontWeight,
          fontSize: size.toDouble(),
          color: color,
          letterSpacing: spacing.toDouble()),
    );
  }
}

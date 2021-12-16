import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextField_Custom extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final double width;
  const TextField_Custom(
      {Key? key,
      required this.text,
      required this.controller,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
        child: Container(
            height: 60,
            width: width,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                controller: controller,
                cursorColor: Colors.orange[800],
                decoration: InputDecoration(
                  hintText: text,
                  hintStyle: GoogleFonts.ubuntu(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            )));
  }
}

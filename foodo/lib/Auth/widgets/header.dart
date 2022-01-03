import 'package:flutter/material.dart';
import 'package:foodo/Onboarding/onboarding_view.dart';
import 'package:foodo/constants/text.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatefulWidget {
  final String text;
  final String subtext;
  const Header({Key? key, required this.text, required this.subtext})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (b) => Onboarding()));
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 25,
                      )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Helper.text(widget.text, 30, 0, Colors.black,
                    FontWeight.w600, TextAlign.center),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22.0, top: 9),
            child: Container(
                constraints: BoxConstraints(maxWidth: 350),
                child: Text(
                  widget.subtext,
                  textAlign: TextAlign.start,
                  style: GoogleFonts.josefinSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                      letterSpacing: 0),
                )),
          )
        ],
      ),
    );
  }
}

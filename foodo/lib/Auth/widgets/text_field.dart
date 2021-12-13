import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/footer.dart';
import 'package:foodo/constants/button.dart';
import 'package:google_fonts/google_fonts.dart';

class Text_Field extends StatefulWidget {
  const Text_Field({
    Key? key,
  }) : super(key: key);

  @override
  _Text_FieldState createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Flexible(
        // height: 500,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: email,
                    cursorColor: Colors.orange[800],
                    decoration: InputDecoration(
                      hintText: "Email",
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
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: password,
                    cursorColor: Colors.orange[800],
                    decoration: InputDecoration(
                      hintText: "Password",
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
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: confirmpassword,
                    cursorColor: Colors.orange[800],
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
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
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
              child: Buttons.Button(
                  Colors.orange[800], 20, 70, double.infinity, "Register"),
            ),
            BottomText.Footer(Colors.grey, "Already have an account?"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

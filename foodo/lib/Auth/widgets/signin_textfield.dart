import 'package:flutter/material.dart';
import 'package:foodo/Auth/Signin.dart';
import 'package:foodo/Auth/widgets/footer.dart';
import 'package:foodo/constants/button.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin_textfield extends StatefulWidget {
  const Signin_textfield({
    Key? key,
  }) : super(key: key);

  @override
  _Signin_textfieldState createState() => _Signin_textfieldState();
}

class _Signin_textfieldState extends State<Signin_textfield> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Flexible(
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 20.0, right: 20, bottom: 10),
              child: Buttons.Button(Colors.orange[800], 10, 70, double.infinity,
                  "Signin", Colors.white),
            ),
            Spacer(),
            Container(
                height: 30,
                width: double.infinity,
                child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/2702/2702602.png")),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (b) => Signin()));
                },
                child:
                    BottomText.Footer(Colors.grey, "Don't have an account?")),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

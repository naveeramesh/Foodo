import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/Signin.dart';
import 'package:foodo/Auth/widgets/footer.dart';
import 'package:foodo/Main/home_view.dart';
import 'package:foodo/constants/text.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup_textfield extends StatefulWidget {
  const Signup_textfield({
    Key? key,
  }) : super(key: key);

  @override
  _Signup_textfieldState createState() => _Signup_textfieldState();
}

class _Signup_textfieldState extends State<Signup_textfield> {
  bool isloading = false;
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneSplCh = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmpassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Flexible(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter a valid mail id";
                      } else {
                        value.contains("@");
                      }
                    },
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
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    onChanged: (password) => onPasswordChanged(password),
                    obscureText: !_isVisible,
                    controller: password,
                    cursorColor: Colors.orange[800],
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible
                            ? Icon(
                                Icons.visibility,
                                color: Colors.black,
                                size: 18,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                                size: 18,
                              ),
                      ),
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
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    obscureText: !_isVisible,
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: _isPasswordEightCharacters
                            ? Colors.red
                            : Colors.transparent,
                        border: _isPasswordEightCharacters
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Password have 8 characters",
                      style: GoogleFonts.ubuntu(
                          color: _isPasswordEightCharacters
                              ? Colors.black
                              : Colors.transparent))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: _hasPasswordOneNumber
                            ? Colors.red
                            : Colors.transparent,
                        border: _hasPasswordOneNumber
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Password atleast have 1 number",
                    style: GoogleFonts.ubuntu(
                        color: _hasPasswordOneNumber
                            ? Colors.black
                            : Colors.transparent),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: _hasPasswordOneSplCh
                            ? Colors.red
                            : Colors.transparent,
                        border: _hasPasswordOneSplCh
                            ? Border.all(color: Colors.transparent)
                            : Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        Icons.verified,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Password atleast have 1 special character",
                    style: GoogleFonts.ubuntu(
                        color: _hasPasswordOneSplCh
                            ? Colors.black
                            : Colors.transparent),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isloading = true;
                    });
                    print(email.text);
                    print(password.text);
                    print(confirmpassword.text);
                    if (email.text.isNotEmpty &&
                        password.text == confirmpassword.text) {
                      signup_email();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.grey[400],
                          content: Helper.text(
                              "Verification mail was sent,Check your inbox",
                              15,
                              0,
                              Colors.black,
                              FontWeight.normal)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.grey[400],
                          content: Helper.text("Provide correct password", 15,
                              0, Colors.black, FontWeight.normal)));
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.orange[800],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: isloading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Helper.text("Register", 20, 0, Colors.white,
                                FontWeight.bold)),
                  )),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (b) => Signin()));
                },
                child:
                    BottomText.Footer(Colors.grey, "Already have an account?")),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void sendverification() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    firebaseUser!.sendEmailVerification();
  }

  void signup_email() async {
    CircularProgressIndicator(
      color: Colors.orange[800],
    );
    User? currentuser;
    await _auth
        .createUserWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim())
        .then((auth) {
      currentuser = auth.user;
      var userid = currentuser!.uid;
      var getemail = currentuser!.email;
      var getname = currentuser!.displayName;
      sendverification();
      save_data();
    }).catchError((e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Helper.text(
              e.toString(), 20, 0, Colors.black, FontWeight.normal)));
    });
    if (currentuser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (b) => HomeScreen()));
    }
  }

  void save_data() {
    Map<String, dynamic> user_data = {
      'uid': _auth.currentUser!.uid,
      "name": _auth.currentUser!.displayName,
      "email": _auth.currentUser!.email,
    };
    FirebaseFirestore.instance
        .collection("Users")
        .doc(_auth.currentUser!.uid)
        .set(user_data);
  }

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final spchar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasPasswordOneSplCh = false;
      if (spchar.hasMatch(password)) _hasPasswordOneSplCh = true;
    });
  }
}

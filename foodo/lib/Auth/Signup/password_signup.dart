import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/constants/text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../userdetails.dart';

class Password_Signup extends StatefulWidget {
  final TextEditingController email;
  const Password_Signup({Key? key, required this.email}) : super(key: key);

  @override
  _Password_SignupState createState() => _Password_SignupState();
}

class _Password_SignupState extends State<Password_Signup> {
  bool isloading = false;
  bool _isvisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneSplCh = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController password = TextEditingController();
  TextEditingController cpcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
              text: "Continue with password",
              subtext: "Type your password to register"),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  onChanged: (password) => onPasswordChanged(password),
                  obscureText: !_isvisible,
                  controller: password,
                  cursorColor: Colors.red[800],
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isvisible = !_isvisible;
                        });
                      },
                      icon: _isvisible
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
                    hintStyle: GoogleFonts.josefinSans(
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
          TextField_Custom(
              text: "Confirm Password",
              controller: cpcontroller,
              width: double.infinity),
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
                          ? Colors.green
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
                    style: GoogleFonts.nunito(
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
                          ? Colors.green
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
                  style: GoogleFonts.nunito(
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
                          ? Colors.green
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
                  style: GoogleFonts.nunito(
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
                  print(widget.email.text);
                  print(password.text);
                  print(cpcontroller.text);
                  if (widget.email.text.isNotEmpty &&
                      password.text == cpcontroller.text) {
                    signup_email();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.grey[400],
                        content: Helper.text(
                            "Verification mail was sent,Check your inbox",
                            15,
                            0,
                            Colors.black,
                            FontWeight.normal,
                            TextAlign.center)));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.grey[400],
                        content: Helper.text(
                            "Provide correct password",
                            15,
                            0,
                            Colors.black,
                            FontWeight.normal,
                            TextAlign.center)));
                  }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red[800],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: isloading
                          ? CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white)
                          : Helper.text("Signup", 20, 0, Colors.white,
                              FontWeight.bold, TextAlign.center)),
                )),
          ),
        ],
      ),
    );
  }

  void signup_email() async {
    CircularProgressIndicator(
      color: Colors.red[800],
    );
    User? currentuser;
    await _auth
        .createUserWithEmailAndPassword(
            email: widget.email.text.trim(), password: password.text.trim())
        .then((auth) {
      currentuser = auth.user;

      sendverification();
      save_data();
    }).catchError((e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Helper.text(e.toString(), 20, 0, Colors.black,
              FontWeight.normal, TextAlign.center)));
    });
    if (currentuser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (b) => Userdetails()));
    }
  }

  void sendverification() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    firebaseUser!.sendEmailVerification();
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

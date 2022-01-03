import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/Signup/email_signup.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/Main/home_view.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';

import '../widgets/footer.dart';

class Password extends StatefulWidget {
  final TextEditingController emailcontroller;
  const Password({Key? key, required this.emailcontroller}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isloading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header(
              text: "Continue with password",
              subtext: "Type your password to login"),
          TextField_Custom(
              text: "Password", controller: password, width: double.infinity),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 10),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isloading = true;
                  });
                  if (password.text.isNotEmpty) {
                    _signin();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.grey,
                        content: Helper.text(
                            "Enter valid details",
                            20,
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
                          : Helper.text("Signin", 20, 0, Colors.white,
                              FontWeight.bold, TextAlign.center)),
                )),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (b) => Signup_Email()));
              },
              child: BottomText.Footer(Colors.grey, "Don't have an account?")),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  //Singin with email and password
  void _signin() async {
    User? currentUser;
    await _auth
        .signInWithEmailAndPassword(
            email: widget.emailcontroller.text.trim(),
            password: password.text.trim())
        .then((value) {
      currentUser = value.user;
    }).catchError((e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Helper.text(e.toString(), 20, 0, Colors.black,
              FontWeight.normal, TextAlign.center)));
    });
    if (currentUser != null) {
      get_data(_auth.currentUser!.uid);
    } else {
      print("Something went wrong");
    }
  }

  get_data(String uid) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .whenComplete(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (b) => HomeScreen()));
    });
  }
}

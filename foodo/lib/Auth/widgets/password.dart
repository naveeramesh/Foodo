import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/Main/home_view.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';

class Password extends StatefulWidget {
  final TextEditingController emailcontroller;
  const Password({Key? key, required this.emailcontroller}) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
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
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {},
              child: Buttons.Button(Colors.red[800], 10, 60, double.infinity,
                  "Signin", Colors.white),
            ),
          )
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
          content: Helper.text(
              e.toString(), 20, 0, Colors.black, FontWeight.normal)));
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

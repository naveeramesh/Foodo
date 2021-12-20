import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/service/google_auth.dart';
import 'package:foodo/Auth/Signin/email.dart';
import 'package:foodo/Auth/userdetails.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Center(
              child: Helper.text(
                  "Foodo", 35, 0, Colors.red[800], FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Helper.text("Create an account,to satisfy your hunger",
                    20, 0, Colors.grey, FontWeight.bold)),
          ),
          Center(
              child: Helper.text(
                  "with Foodo", 20, 0, Colors.grey, FontWeight.bold)),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                signin().whenComplete(() {
                  if (_auth.currentUser?.uid == null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.grey[400],
                        content: Helper.text("Signin to order food", 15, 0,
                            Colors.black, FontWeight.normal)));
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (b) => Userdetails()));
                  }
                });
              },
              child: Buttons.Button(Colors.grey[300], 20, 60, double.infinity,
                  "Continue with Google", Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (b) => Signin_New()));
              },
              child: Buttons.Button(Colors.red[800]!, 20, 60, double.infinity,
                  "Continue with email", Colors.white),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Helper.text(
                    "I agree to the terms and conditions and private policy of Foodo",
                    15,
                    0,
                    Colors.grey,
                    FontWeight.bold)),
          )
        ],
      ),
    );
  }
}

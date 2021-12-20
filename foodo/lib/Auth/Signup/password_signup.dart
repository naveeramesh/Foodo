import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/constants/text.dart';

import '../userdetails.dart';

class Password_Signup extends StatefulWidget {
  final TextEditingController email;
  const Password_Signup({Key? key, required this.email}) : super(key: key);

  @override
  _Password_SignupState createState() => _Password_SignupState();
}

class _Password_SignupState extends State<Password_Signup> {
  bool isloading = false;

  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneSplCh = false;
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
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.grey,
                        content: Helper.text("Enter valid details", 20, 0,
                            Colors.black, FontWeight.normal)));
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
                          : Helper.text(
                              "Signup", 20, 0, Colors.white, FontWeight.bold)),
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
          content: Helper.text(
              e.toString(), 20, 0, Colors.black, FontWeight.normal)));
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

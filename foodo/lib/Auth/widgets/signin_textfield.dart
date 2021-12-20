import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/Signin.dart';
import 'package:foodo/Auth/Signup.dart';
import 'package:foodo/Auth/service/google_auth.dart';
import 'package:foodo/Auth/userdetails.dart';
import 'package:foodo/Auth/widgets/footer.dart';
import 'package:foodo/Main/home_view.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin_textfield extends StatefulWidget {
  const Signin_textfield({
    Key? key,
  }) : super(key: key);

  @override
  _Signin_textfieldState createState() => _Signin_textfieldState();
}

class _Signin_textfieldState extends State<Signin_textfield> {
  bool isloading = false;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Form(
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
                    obscureText: true,
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
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isloading = true;
                    });
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      _signin();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.grey,
                          content: Helper.text("Enter valid details", 15, 0,
                              Colors.black, FontWeight.normal)));
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
                            ? CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white)
                            : Helper.text(
                                "Login", 20, 0, Colors.white, FontWeight.bold)),
                  )),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                signin().whenComplete(() {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (b) => HomeScreen()));
                });
              },
              child: Container(
                  height: 20,
                  width: double.infinity,
                  child: Image.network(
                      "https://cdn-icons-png.flaticon.com/512/2702/2702602.png")),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (b) => Signup()));
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

//Singin with email and password
  void _signin() async {
    User? currentUser;
    await _auth
        .signInWithEmailAndPassword(
            email: email.text.trim(), password: password.text.trim())
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

import 'package:flutter/material.dart';
import 'package:foodo/Auth/Signup/password_signup.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/Signin/password.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/constants/text.dart';

class Signup_Email extends StatefulWidget {
  const Signup_Email({Key? key}) : super(key: key);

  @override
  _Signup_EmailState createState() => _Signup_EmailState();
}

class _Signup_EmailState extends State<Signup_Email> {
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[800],
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {
          emailcontroller.text.isEmpty
              ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.grey[400],
                  content: Helper.text("Enter your mail id to continue", 20, 0,
                      Colors.black, FontWeight.normal)))
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (b) => Password_Signup(
                            email: emailcontroller,
                          ))
                      );
        },
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Header(
              text: "Create an account",
              subtext: "So you can enjoy the delicious food by door step",
            ),
            TextField_Custom(
                text: "Email",
                controller: emailcontroller,
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}

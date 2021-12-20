import 'package:flutter/material.dart';
import 'package:foodo/Auth/Signup/email_signup.dart';
import 'package:foodo/Auth/Signup/password_signup.dart';
import 'package:foodo/Auth/widgets/footer.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/Signin/password.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/constants/text.dart';

class Signin_New extends StatefulWidget {
  const Signin_New({Key? key}) : super(key: key);

  @override
  _Signin_NewState createState() => _Signin_NewState();
}

class _Signin_NewState extends State<Signin_New> {
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
                  content: Helper.text("Enter your mail id to register", 20, 0,
                      Colors.black, FontWeight.normal)))
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (b) => Password_Signup(
                            email: emailcontroller,
                          )));
        },
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Header(
              text: "Welcome back",
              subtext:
                  "We are so happy that you came back to satisfy your hunger enjoy the unlimited services.",
            ),
            TextField_Custom(
                text: "Email",
                controller: emailcontroller,
                width: double.infinity),
            Spacer(),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (b) => Signup_Email()));
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

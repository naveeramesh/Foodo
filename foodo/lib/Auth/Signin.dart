import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/signin_textfield.dart';
import 'package:foodo/Auth/widgets/signuo_textfield.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Header(
              text: "Welcome back",
              subtext: "Login to your account",
            ),
            Signin_textfield()
          ],
        ),
      ),
    );
  }
}

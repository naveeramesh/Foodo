import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/text_field.dart';
import 'package:foodo/constants/text.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Header(
              text: "Welcome to Foodo",
              subtext: "Create your account",
            ),
            Text_Field(),
          ],
        ),
      ),
    );
  }
}

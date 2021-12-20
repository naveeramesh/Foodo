import 'package:flutter/material.dart';
import 'package:foodo/Auth/widgets/header.dart';
import 'package:foodo/Auth/widgets/textfield.dart';

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
        onPressed: () {},
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
                width: double.infinity)
          ],
        ),
      ),
    );
  }
}

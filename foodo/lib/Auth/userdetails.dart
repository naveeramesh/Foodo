import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Auth/location.dart';
import 'package:foodo/Auth/service/google_auth.dart';
import 'package:foodo/Auth/widgets/gender.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({Key? key}) : super(key: key);

  @override
  _UserdetailsState createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloading = false;
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController phno = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Helper.text("Update your details ", 18, 0, Colors.grey[800],
                      FontWeight.w600),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2),
              child: Helper.text(
                  "One step ahead", 15, 0, Colors.grey[400], FontWeight.normal),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextField_Custom(
                text: "First Name",
                controller: firstnamecontroller,
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              Expanded(
                child: TextField_Custom(
                  text: "Last Name",
                  controller: lastnamecontroller,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
          TextField_Custom(
            text: "Phone Number",
            controller: phno,
            width: double.infinity,
          ),
          TextField_Custom(
            text: "Email",
            controller: mail,
            width: double.infinity,
          ),
          Gender(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    isloading = true;
                  });
                  FirebaseFirestore.instance
                      .collection("Userinfo")
                      .doc(_auth.currentUser!.uid)
                      .update({
                    "firstname": firstnamecontroller.text.trim(),
                    'lastname': lastnamecontroller.text.trim(),
                    'name': firstnamecontroller.text.toString() +
                        lastnamecontroller.text.toString(),
                    'email': mail.text.trim(),
                    'phonenumber': phno.text.trim(),
                  }).whenComplete(() {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (b) => Location()));
                  });
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
                              "Update", 20, 0, Colors.white, FontWeight.bold)),
                )),
          )
        ],
      ),
    );
  }
}

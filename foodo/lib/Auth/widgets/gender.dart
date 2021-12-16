import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Object? valuechoose;
  List _types = [
    'Male',
    'Female',
    'Others',
    'Rather not say',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: valuechoose,
            hint: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Helper.text(
                    "Gender", 16, 0, Colors.grey[800], FontWeight.normal)),
            isExpanded: true,
            onChanged: (newValue) {
              setState(() {
                valuechoose = newValue;
                print(newValue);
                print(valuechoose.toString());
                FirebaseFirestore.instance
                    .collection("Userinfo")
                    .doc(_auth.currentUser!.uid)
                    .set({'gender': valuechoose.toString()});
              });
            },
            items: _types.map((e) {
              return DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Helper.text(
                        e, 16, 0, Colors.grey[800], FontWeight.normal),
                  ));
            }).toList(),
          ),
        ),
      ),
    );
  }
}

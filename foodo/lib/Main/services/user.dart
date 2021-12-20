import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

class UserHeader extends StatefulWidget {
  // final String? address;
  const UserHeader({
    Key? key,
  }) : super(key: key);

  @override
  _UserHeaderState createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? name;
  String? address;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Userinfo")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      print(value.data());
      setState(() {
        name = value.data()?['name'];
        address = value.data()?['userlocation'];
      });
      print(name);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.black26,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Helper.text("${name}", 22, 0, Colors.black, FontWeight.bold),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Helper.text(
                        "${address}", 10, 0, Colors.grey, FontWeight.normal),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

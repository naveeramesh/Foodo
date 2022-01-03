import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Main/cart.dart';
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
      child: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.red[800],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Helper.text("${name}", 22, 0, Colors.black, FontWeight.bold,
                  TextAlign.center),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Helper.text("${address}", 10, 0, Colors.grey,
                    FontWeight.normal, TextAlign.center),
              )
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.grey[400],
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (b) => Cart()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.red[800],
              ))
        ],
      ),
    );
  }
}

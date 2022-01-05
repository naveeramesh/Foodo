import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Main/cart.dart';
import 'package:foodo/Main/wishlist.dart';
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
  int? length;
  int? wish_length;

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
    FirebaseFirestore.instance
        .collection("Userinfo")
        .doc(_auth.currentUser!.uid)
        .collection("Cart")
        .get()
        .then((value) {
      setState(() {
        length = value.docs.length;
      });
      print(length);
    });
    FirebaseFirestore.instance
        .collection("Userinfo")
        .doc(_auth.currentUser!.uid)
        .collection("WishList")
        .get()
        .then((value) {
      setState(() {
        wish_length = value.docs.length;
      });
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
          Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          SizedBox(
            width: 7,
          ),
          Stack(children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (b) => WishList()));
              },
              child: Icon(
                Icons.favorite,
                color: Colors.grey[400],
              ),
            ),
            Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundColor:
                      wish_length == 0 ? Colors.transparent : Colors.red[800],
                  radius: 3,
                ))
          ]),
          Stack(children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (b) => Cart()));
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey[400],
                )),
            Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  backgroundColor:
                      length == 0 ? Colors.transparent : Colors.red[800],
                  radius: 5,
                  child: Helper.text(length.toString(), 5, 0, Colors.white,
                      FontWeight.bold, TextAlign.center),
                ))
          ])
        ],
      ),
    );
  }
}

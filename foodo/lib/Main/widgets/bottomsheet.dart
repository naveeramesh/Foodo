import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

class modelSheet extends StatefulWidget {
  final String name;

  const modelSheet({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  _modelSheetState createState() => _modelSheetState();
}

class _modelSheetState extends State<modelSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Userinfo")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("Cart")
            .where("Pd name", isEqualTo: widget.name)
            .snapshots(),
        builder: (context, snapshot) => new Container(
            child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20),
                  child: Helper.text("Quantity", 20, 0, Colors.black,
                      FontWeight.bold, TextAlign.start),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        snapshot.data!.docs[0]['quantity'] == 1
                            ? null
                            : FirebaseFirestore.instance
                                .collection("Userinfo")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection("Cart")
                                .doc(widget.name)
                                .update({
                                "quantity":
                                    snapshot.data!.docs[0]['quantity'] - 1,
                              });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Icon(
                          Icons.remove,
                          size: 15,
                        )),
                      ),
                    ),
                  ),
                  Helper.text(snapshot.data!.docs[0]['quantity'].toString(), 20,
                      0, Colors.black, FontWeight.bold, TextAlign.start),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        FirebaseFirestore.instance
                            .collection("Userinfo")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection("Cart")
                            .doc(widget.name)
                            .update({
                          "quantity": snapshot.data!.docs[0]['quantity'] + 1,
                        });
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Icon(
                          Icons.add,
                          size: 15,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

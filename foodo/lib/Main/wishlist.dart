import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Helper.text("Wishlist", 18, 0, Colors.black, FontWeight.bold,
              TextAlign.center),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Userinfo")
              .doc(_auth.currentUser!.uid)
              .collection("WishList")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 300,
                      maxCrossAxisExtent: 250,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      snapshot.data!.docs[index]['image']),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 2),
                          child: Row(
                            children: [
                              Helper.text(
                                  snapshot.data!.docs[index]['Pd name'],
                                  12,
                                  0,
                                  Colors.black,
                                  FontWeight.bold,
                                  TextAlign.center),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Helper.text(
                                snapshot.data!.docs[index]['type'],
                                10,
                                0,
                                Colors.grey[600],
                                FontWeight.normal,
                                TextAlign.center),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Row(
                            children: [
                              Helper.text(
                                  "₹ " +
                                      snapshot.data!.docs[index]['amount']
                                          .toString(),
                                  14,
                                  0,
                                  Colors.green[600],
                                  FontWeight.bold,
                                  TextAlign.center),
                              SizedBox(
                                width: 8,
                              ),
                              Helper.text(
                                  "" +
                                      snapshot.data!.docs[index]['rating']
                                          .toString(),
                                  14,
                                  0,
                                  Colors.black,
                                  FontWeight.bold,
                                  TextAlign.center),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                    child: Helper.text(
                                        "Add to bag",
                                        12,
                                        0,
                                        Colors.white,
                                        FontWeight.bold,
                                        TextAlign.center)),
                              ),
                              GestureDetector(
                                onTap: () {
                                  delete(snapshot.data!.docs[index]['Pd name']);
                                },
                                child: Icon(
                                  Icons.delete_sharp,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void delete(String name) {
    FirebaseFirestore.instance
        .collection("Userinfo")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Wishlist")
        .doc(name)
        .delete();
  }
}

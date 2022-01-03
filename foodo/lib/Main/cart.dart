import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Helper.text("Bucket List", 20, 0, Colors.black, FontWeight.bold,
            TextAlign.start),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Userinfo")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("Cart")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot
                                            .data!.docs[index]['image']),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[200],
                                  ),
                                  height: 80,
                                  width: 90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Helper.text(
                                            snapshot.data!.docs[index]
                                                ['Pd name'],
                                            15,
                                            0,
                                            Colors.black,
                                            FontWeight.bold,
                                            TextAlign.center),
                                        Row(
                                          children: [
                                            Helper.text(
                                                "₹ " +
                                                    snapshot.data!
                                                        .docs[index]['amount']
                                                        .toString(),
                                                13,
                                                0,
                                                Colors.black,
                                                FontWeight.bold,
                                                TextAlign.start),
                                            SizedBox(width: 5),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Colors.grey[300],
                                              ),
                                              height: 25,
                                              child: Row(
                                                children: [
                                                  Helper.text(
                                                      " Qty : " +
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                                  ['quantity']
                                                              .toString(),
                                                      13,
                                                      0,
                                                      Colors.black,
                                                      FontWeight.bold,
                                                      TextAlign.center),
                                                  GestureDetector(
                                                    onTap: (){
                                                      
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
                                                      color: Colors.red[700],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Helper.text("Delete", 10, 0, Colors.red[800],
                                    FontWeight.bold, TextAlign.center),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

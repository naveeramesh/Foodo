import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';

import 'details.dart';

class Category_View extends StatefulWidget {
  final String? name;
  const Category_View({Key? key, required this.name}) : super(key: key);

  @override
  _Category_ViewState createState() => _Category_ViewState();
}

class _Category_ViewState extends State<Category_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.clear,
                color: Colors.black,
              ))
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Helper.text(widget.name.toString(), 18, 0, Colors.black, FontWeight.bold,
              TextAlign.center),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("TopOrders")
              .where("category", isEqualTo: widget.name)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                transitionDuration: Duration(seconds: 2),
                                pageBuilder: (_, __, ___) => Detail_Screen(
                                    querySnapshot:
                                        snapshot.data!.docs[index])));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Hero(
                                tag: "ViewDetails",
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 10,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(6),
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data!.docs[index]['image']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12.0,
                                  ),
                                  child: Helper.text(
                                      "${snapshot.data!.docs[index]['name']}",
                                      15,
                                      0,
                                      Colors.black,
                                      FontWeight.w600,
                                      TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 7.0, bottom: 7),
                                  child: Helper.text(
                                      "${snapshot.data!.docs[index]['ingredienttype']}",
                                      12,
                                      0,
                                      Colors.grey,
                                      FontWeight.w600,
                                      TextAlign.center),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[700],
                                      size: 19,
                                    ),
                                    Helper.text(
                                        "${snapshot.data!.docs[index]['rating'].toString()}",
                                        12,
                                        0,
                                        Colors.black,
                                        FontWeight.w600,
                                        TextAlign.center),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Helper.text(
                                  "₹ " +
                                      "${snapshot.data!.docs[index]['amount']}",
                                  12,
                                  0,
                                  Colors.red[800],
                                  FontWeight.w600,
                                  TextAlign.center),
                            )
                          ],
                        ),
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

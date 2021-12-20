import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TopOrders extends StatefulWidget {
  const TopOrders({Key? key}) : super(key: key);

  @override
  _TopOrdersState createState() => _TopOrdersState();
}

class _TopOrdersState extends State<TopOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("TopOrders").snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image:
                              NetworkImage(snapshot.data!.docs[index]['Image']),
                          fit: BoxFit.cover)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

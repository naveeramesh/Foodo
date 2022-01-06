import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Main/category_view.dart';
import 'package:foodo/constants/text.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Category").snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (b) => Category_View(
                                    name: snapshot.data!.docs[index]['name'])));
                      },
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data!.docs[index]['Image']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 25,
                      child: Helper.text(
                          "${snapshot.data!.docs[index]['name']}",
                          12,
                          0,
                          Colors.white,
                          FontWeight.w600,
                          TextAlign.center))
                ]);
              },
            );
          },
        ));
  }
}

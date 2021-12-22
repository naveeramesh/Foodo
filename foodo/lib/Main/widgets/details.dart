import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Main/widgets/ratings.dart';
import 'package:foodo/constants/text.dart';

class Detail_Screen extends StatefulWidget {
  final QueryDocumentSnapshot querySnapshot;
  const Detail_Screen({Key? key, required this.querySnapshot})
      : super(key: key);

  @override
  _Detail_ScreenState createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  int? quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 18,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: "ViewDetails",
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: NetworkImage(widget.querySnapshot['image']),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                StarRating(
                  rating: widget.querySnapshot['rating'],
                  color: Colors.yellow[800],
                  size: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Helper.text("${widget.querySnapshot['rating']}", 18, 0,
                      Colors.grey[600], FontWeight.bold, TextAlign.start),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Helper.text("${widget.querySnapshot['name']}", 25, 0,
                    Colors.black, FontWeight.bold, TextAlign.start),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            size: 15,
                          )),
                      Helper.text(quantity.toString(), 15, 0, Colors.black,
                          FontWeight.bold, TextAlign.start),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 15,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 8),
            child: Row(
              children: [
                Helper.text("${widget.querySnapshot['ingredienttype']}", 14, 0,
                    Colors.grey, FontWeight.bold, TextAlign.start),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
                child: Helper.text("Description", 18, 0, Colors.black,
                    FontWeight.bold, TextAlign.start),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Container(
              child: Helper.text("${widget.querySnapshot['description']}", 15,
                  0, Colors.grey, FontWeight.bold, TextAlign.start),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

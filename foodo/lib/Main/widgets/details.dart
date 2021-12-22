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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
            size: 18,
          )),
      body: Column(
        children: [
          Helper.text("${widget.querySnapshot['name']}", 20, 0, Colors.black,
              FontWeight.bold, TextAlign.center),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Helper.text("${widget.querySnapshot['ingredienttype']}", 15,
                0, Colors.grey, FontWeight.bold, TextAlign.center),
          ),
          StarRating(
            rating: widget.querySnapshot['rating'],
            color: Colors.yellow[800],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: "ViewDetails",
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.height / 3,
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
            padding: const EdgeInsets.only(left: 10.0, top: 20),
            child: Container(
              child: Helper.text("${widget.querySnapshot['description']}", 15,
                  0, Colors.black, FontWeight.bold, TextAlign.start),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

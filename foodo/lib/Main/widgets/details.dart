import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detail_Screen extends StatefulWidget {
  final AsyncSnapshot<QuerySnapshot> querySnapshot;
  const Detail_Screen({Key? key, required this.querySnapshot})
      : super(key: key);

  @override
  _Detail_ScreenState createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

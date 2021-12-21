import 'package:flutter/material.dart';

class Poster extends StatefulWidget {
  const Poster({Key? key}) : super(key: key);

  @override
  _PosterState createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: Image.network(""),
    );
  }
}

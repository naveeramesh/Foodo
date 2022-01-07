import 'package:flutter/material.dart';

class Poster extends StatefulWidget {
  const Poster({Key? key}) : super(key: key);

  @override
  _PosterState createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 22.0, left: 20, right: 20, bottom: 20),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red[800],
            image: DecorationImage(
                image: AssetImage("assets/images/poster.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}

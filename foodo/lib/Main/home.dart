import 'package:flutter/material.dart';
import 'package:foodo/Main/widgets/poster.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [Poster(), Poster(), Poster(), Poster()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

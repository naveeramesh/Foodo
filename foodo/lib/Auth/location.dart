import 'package:flutter/material.dart';
import 'package:foodo/constants/text.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie/lottie.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Lottie.network(
              "https://assets1.lottiefiles.com/temp/lf20_EVDaJ0.json"),
        )),
        Helper.text("Fetching Location", 20, 0, Colors.black, FontWeight.bold)
      ],
    ));
  }
}

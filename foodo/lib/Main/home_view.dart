import 'package:flutter/material.dart';
import 'package:foodo/Main/widgets/categouries.dart';
import 'package:foodo/constants/text.dart';
import 'widgets/user.dart';
import 'widgets/carosuel.dart';

class HomeScreen extends StatefulWidget {
  final String? address;
  const HomeScreen({Key? key, this.address}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          UserHeader(),
          CarosuelLider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Helper.text("Categories", 18, 0, Colors.black, FontWeight.w600),
              ],
            ),
          ),
          Category()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodo/Main/services/user.dart';
import 'package:foodo/constants/text.dart';

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
      backgroundColor: Colors.white,
      body: UserHeader(),
    );
  }
}

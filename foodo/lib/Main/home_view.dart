import 'package:flutter/material.dart';
import 'package:foodo/Main/widgets/categouries.dart';
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
        children: [UserHeader(), 
        CarosuelLider(),
        Category()],
      ),
    );
  }
}

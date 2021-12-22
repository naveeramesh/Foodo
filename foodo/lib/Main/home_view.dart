import 'package:flutter/material.dart';
import 'package:foodo/Main/widgets/categouries.dart';
import 'package:foodo/Main/widgets/poster.dart';
import 'package:foodo/Main/widgets/top_orders.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, elevation: 0, title: UserHeader()),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: CarosuelLider(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 20, bottom: 15),
                child: Row(
                  children: [
                    Helper.text(
                        "Categories", 18, 0, Colors.black, FontWeight.w600,TextAlign.center),
                  ],
                ),
              ),
              Category(),
              Poster(),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Helper.text(
                        "Top Orders", 18, 0, Colors.black, FontWeight.w600,TextAlign.center),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Row(
                        children: [
                          Helper.text("View more", 12, 0, Colors.red[800],
                              FontWeight.w600,TextAlign.center),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.red[800],
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TopOrders()
            ],
          ),
        ),
      ),
    );
  }
}

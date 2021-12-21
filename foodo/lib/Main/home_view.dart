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
        elevation: 0,
        backgroundColor: Colors.white,
        title: UserHeader(),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: CarosuelLider(),
            ),
            SingleChildScrollView(
                child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, bottom: 15),
                    child: Row(
                      children: [
                        Helper.text(
                            "Categories", 18, 0, Colors.black, FontWeight.w600),
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
                            "Top Orders", 18, 0, Colors.black, FontWeight.w600),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              Helper.text("View more", 12, 0, Colors.red[800],
                                  FontWeight.w600),
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
                  TopOrders(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

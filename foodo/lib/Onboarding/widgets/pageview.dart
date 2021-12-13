import 'package:flutter/material.dart';
import 'package:foodo/Onboarding/widgets/data.dart';
import 'package:foodo/constants/text.dart';

class Page_View extends StatefulWidget {
  final Items items;

  const Page_View({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _Page_ViewState createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 10,
      ),
      Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Image.asset(widget.items.imageurl)),
      SizedBox(
        height: 30,
      ),
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
              child: Helper.text("${widget.items.title}", 21, 0, Colors.black,
                  FontWeight.w500))),
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Helper.text("${widget.items.description}", 18, 0,
                  Colors.black, FontWeight.normal),
            )),
          )),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:foodo/Auth/location.dart';
import 'package:foodo/Auth/widgets/gender.dart';
import 'package:foodo/Auth/widgets/textfield.dart';
import 'package:foodo/constants/button.dart';
import 'package:foodo/constants/text.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({Key? key}) : super(key: key);

  @override
  _UserdetailsState createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController phno = new TextEditingController();
  TextEditingController mail = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Helper.text("Update your details ", 18, 0, Colors.grey[800],
                      FontWeight.w600),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 2),
              child: Helper.text(
                  "One step ahead", 15, 0, Colors.grey[400], FontWeight.normal),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextField_Custom(
                text: "First Name",
                controller: namecontroller,
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              Expanded(
                child: TextField_Custom(
                  text: "Last Name",
                  controller: namecontroller,
                  width: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
          TextField_Custom(
            text: "Phone Number",
            controller: phno,
            width: double.infinity,
          ),
          TextField_Custom(
            text: "Email",
            controller: mail,
            width: double.infinity,
          ),
          Gender(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Buttons.Button(Colors.orange[800], 10, 60, double.infinity,
                "Update", Colors.white),
          )
        ],
      ),
    );
  }
}

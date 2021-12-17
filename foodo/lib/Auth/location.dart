import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodo/Main/home_view.dart';
import 'package:foodo/constants/text.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late StreamSubscription<Position> streamSubscription;
  FirebaseAuth _auth = FirebaseAuth.instance;
  var lattiude = '';
  var longitude = '';
  var address = '';
  @override
  void initState() {
    getlocation();
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

  void getlocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      lattiude = "${position.latitude}";
      longitude = "${position.longitude}";
      print(lattiude);
      print(longitude);
      getAddress(position);
    });
  }

  Future<void> getAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.latitude);
    Placemark location = placemark[0];
    address = "${location.name}" +
        " " +
        "${location.street}" +
        " " +
        "${location.country}";

    print(address);
    addfirebase(address);
  }

  void addfirebase(var address) async {
    FirebaseFirestore.instance
        .collection("Userinfo")
        .doc(_auth.currentUser!.uid)
        .update({
      'userlocation': address,
    }).whenComplete(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (b) => HomeScreen()));
    });
  }
}

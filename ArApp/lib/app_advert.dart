import 'package:flutter/material.dart';

class AdToApp extends StatefulWidget {
  AdToApp({Key? key}) : super(key: key);

  @override
  State<AdToApp> createState() => _AdToAppState();
}

class _AdToAppState extends State<AdToApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "We saw some signs of Poor Mental Health from your options, Try our App for Detailed Analysis ,\nhere",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Image.asset('assets/qr.jpeg'),
        ],
      ),
    ));
  }
}

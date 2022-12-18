import 'package:flutter/material.dart';

class Wating extends StatefulWidget {
  const Wating({Key? key}) : super(key: key);

  @override
  State<Wating> createState() => _WatingState();
}

class _WatingState extends State<Wating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "CONFIRMATION",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
      ),
      body: Center(
          child: Column(
        children: const [
          SizedBox(height: 350),
          Text(
            "Plz Wait For Confirmation by Admin",
            style: TextStyle(
                fontFamily: 'sharetech',
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "(May Take a Week)",
            style: TextStyle(
                fontFamily: 'sharetech',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      )),
    );
  }
}

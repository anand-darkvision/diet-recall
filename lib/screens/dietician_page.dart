import 'package:dietrecallapp/screens/LoginPage.dart';
import 'package:flutter/material.dart';

class DieticianPage extends StatefulWidget {
  const DieticianPage({Key? key}) : super(key: key);

  @override
  State<DieticianPage> createState() => _DieticianPageState();
}

class _DieticianPageState extends State<DieticianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: const Text(
          "Dietician",
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 168, 184, 139),
      ),
    );
  }
}

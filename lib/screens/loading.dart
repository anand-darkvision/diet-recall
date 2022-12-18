import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 168, 184, 139),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.black,
            size: 50,
            duration: Duration(seconds: 4),
          ),
        ),
      ),
    );
  }
}

import 'package:dietrecallapp/screens/dietician_register.dart';
import 'package:dietrecallapp/screens/registration.dart';
import 'package:flutter/material.dart';

class Dietician extends StatefulWidget {
  const Dietician({Key? key}) : super(key: key);

  @override
  State<Dietician> createState() => _DieticianState();
}

class _DieticianState extends State<Dietician> {
  //regular user
  bool value = false;
  int val = -1;

  // dietician

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Register Selection",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Select The User Mode",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'sharetech',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: <Widget>[
                const SizedBox(width: 30),
                const Text(
                  "User",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(width: 80),
                Radio(
                  value: 0,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 55),
            Row(
              children: [
                const SizedBox(width: 30),
                const Text(
                  "Dietician",
                  style: TextStyle(
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(width: 40),
                Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 70,
              width: 300,
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 58, 62, 89),
                child: MaterialButton(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: 300,
                    onPressed: () {
                      if (val == 0) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Register()));
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const DieticianRegister()));
                      }
                    },
                    child: const Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

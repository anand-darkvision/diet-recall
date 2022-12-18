// ignore_for_file: non_constant_identifier_names

import 'package:dietrecallapp/usermodel/rewardpoint.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  dynamic percent = 0.0;
  dynamic points1 = 0;
  dynamic points = 0;

  getwater() {
    print('execyted jkjhkjgjhgfjfgjh');
    Hive.openBox('point');
    Box gh = Hive.box('point');
    if (gh.length == 0) {
      print('this emt');
      setState(() {
        percent = 0;
        points = 0;
      });
    } else {
      print(gh.length);
      print('this');
      final contact1Box = Hive.box("point");
      final contact_break = contact1Box.getAt(0) as rewardpoint;
      double water = contact_break.point;
      setState(() {
        points = water.round() / -1;

        percent = water;
      });
    }
  }

  @override
  void initState() {
    Hive.openBox("water");
    getwater();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Hive.openBox("water");
    var t = AppLocalizations.of(context);
    print(percent);
    setState(() {});
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: const Text("")),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
          title: Text(
            "${t?.reward}",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 700,
            width: 350,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Image.asset("assets/images/reward.png"),
                    const SizedBox(height: 10),
                    Text(
                      "${points1}",
                      style: const TextStyle(
                        fontFamily: "Raleway",
                        color: Color.fromARGB(255, 168, 184, 139),
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Image.asset("assets/images/medal.png"),
                    const SizedBox(height: 30),
                    Text(
                      "${t?.getmoreoints}",
                      style: const TextStyle(
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: LinearPercentIndicator(
                        width: 310.0,
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 5.0,
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Colors.red,
                      ),
                    ),
                    const SizedBox(height: 160),
                    Text(
                      "${t?.follwyourdiet}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sharetech",
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

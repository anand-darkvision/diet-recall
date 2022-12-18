// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'dart:math';

import 'package:dietrecallapp/model/bodytype.dart';
import 'package:dietrecallapp/screens/homepage.dart';
import 'package:dietrecallapp/screens/vatapita.dart';
import 'package:dietrecallapp/usermodel/bodytype.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  late Box box8;
  //box open
  void createbox() async {
    box8 = await Hive.openBox('bodytype');
  }

  @override
  void initState() {
    createbox();
    super.initState();
  }

  int vat = 0;
  int pitta = 0;
  int kapa = 0;

  bool value = false;
  double val = -1.0;

  bool value_1 = false;
  double val_1 = -1.0;

  bool value_2 = false;
  double val_2 = -1.0;

  bool value_4 = false;
  double val_4 = -1.0;

  bool value_5 = false;
  double val_5 = -1.0;

  bool value_6 = false;
  double val_6 = -1.0;

  bool value_7 = false;
  double val_7 = -1.0;

  bool value_8 = false;
  double val_8 = -1.0;

  bool value_9 = false;
  double val_9 = -1.0;

  bool value_10 = false;
  double val_10 = -1.0;

  bool value_11 = false;
  double val_11 = -1.0;

  bool value_12 = false;
  double val_12 = -1.0;

  bool value_13 = false;
  double val_13 = -1.0;

  bool value_14 = false;
  double val_14 = -1.0;

  bool value_15 = false;
  double val_15 = -1.0;

  bool value_16 = false;
  double val_16 = -1.0;

  bool value_17 = false;
  double val_17 = -1.0;

  bool value_18 = false;
  double val_18 = -1.0;

  bool value_19 = false;
  double val_19 = -1.0;

  bool value_20 = false;
  double val_20 = -1.0;

  final contactBox = Hive.box('bodytype');
  void bodytypeadd(bodytype_Contact contact) async {
    await contactBox.add(contact);
  }

  @override
  Widget build(BuildContext context) {
    Hive.openBox('bodytype');
    final submitQuizButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () async {
            await Hive.openBox('bodytype');
            dynamic res = score([
              val.toDouble(),
              val_1.toDouble(),
              val_2.toDouble(),
              val_4.toDouble(),
              val_5.toDouble(),
              val_6.toDouble(),
              val_7.toDouble(),
              val_8.toDouble(),
              val_9.toDouble(),
              val_10.toDouble(),
              val_11.toDouble(),
              val_12.toDouble(),
              val_13.toDouble(),
              val_14.toDouble(),
              val_15.toDouble(),
              val_16.toDouble(),
              val_17.toDouble(),
              val_18.toDouble(),
              val_19.toDouble(),
              val_20.toDouble()
            ]);

            // setState(() {});
            Box box = Hive.box("bodytype");
            if (box.isEmpty) {
              setState(() {
                final fg = bodytype_Contact(res);
                bodytypeadd(fg);
                print("added successfully");
                print(res);
              });
            } else {
              setState(() {
                box.clear();
              });
            }
            setState(() {
              final fg = bodytype_Contact(res);
              bodytypeadd(fg);
              print("added successfully");
              print(res);
            });

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DietChart()));
          },
          child: const Text(
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "Sharetech"),
          )),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: TextButton.icon(
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: const Text("")),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
          title: const Text(
            "Survey",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "1. Body size",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Slim",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Medium",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Large",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "2.Body weight",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "low, difficulties in gaining weight",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_1,
                  onChanged: (value_1) {
                    setState(() {
                      val_1 = value_1 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "moderate, no difficulties in gaining or loosing weight",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_1,
                  onChanged: (value_1) {
                    setState(() {
                      val_1 = value_1 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "heavy, difficulties in loosing weight",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_1,
                  onChanged: (value_1) {
                    setState(() {
                      val_1 = value_1 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "3. Height",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Tall or short",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_2,
                  onChanged: (value_2) {
                    setState(() {
                      val_2 = value_2 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Average",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_2,
                  onChanged: (value_2) {
                    setState(() {
                      val_2 = value_2 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Thin & sturdy / short & stocky",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_2,
                  onChanged: (value_2) {
                    setState(() {
                      val_2 = value_2 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "4.Bone Structure",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Light, small bones, Prominent joints",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_4,
                  onChanged: (value_4) {
                    setState(() {
                      val_4 = value_4 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Medium bone structure",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_4,
                  onChanged: (value_4) {
                    setState(() {
                      val_4 = value_4 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Large, broad shoulders, Heavy bone structure",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_4,
                  onChanged: (value_4) {
                    setState(() {
                      val_4 = value_4 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "5. Complexion",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Dark complexion, Tans easily",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_5,
                  onChanged: (value_5) {
                    setState(() {
                      val_5 = value_5 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Fair skin, sun burns easily",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_5,
                  onChanged: (value_5) {
                    setState(() {
                      val_5 = value_5 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "White, pale, tans evenly",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_5,
                  onChanged: (value_5) {
                    setState(() {
                      val_5 = value_5 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "6.General feel of skin",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Thin and dry, cool to touch, rough",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_6,
                  onChanged: (value_6) {
                    setState(() {
                      val_6 = value_6 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Smooth and warm, Oily T-zone",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_6,
                  onChanged: (value_6) {
                    setState(() {
                      val_6 = value_6 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "thick and moist/greasy, cold",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_6,
                  onChanged: (value_6) {
                    setState(() {
                      val_6 = value_6 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "7.Texture of Skin",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Dry, pigmentation and aging",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_7,
                  onChanged: (value_7) {
                    setState(() {
                      val_7 = value_7 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Freckles, many moles, redness, rashes and acne",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_7,
                  onChanged: (value_7) {
                    setState(() {
                      val_7 = value_7 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Soft, glowing and youthful",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_7,
                  onChanged: (value_7) {
                    setState(() {
                      val_7 = value_7 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "8.Hair Color",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Dull, black, brown",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_8,
                  onChanged: (value_8) {
                    setState(() {
                      val_8 = value_8 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Red, light brown, yellow",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_8,
                  onChanged: (value_8) {
                    setState(() {
                      val_8 = value_8 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Brown",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_8,
                  onChanged: (value_8) {
                    setState(() {
                      val_8 = value_8 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "9.Appearance of Hair",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Dry, Black Knotted, Brittle",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_9,
                  onChanged: (value_9) {
                    setState(() {
                      val_9 = value_9 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Straight, Oily",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_9,
                  onChanged: (value_9) {
                    setState(() {
                      val_9 = value_9 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Thick, Curly",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_9,
                  onChanged: (value_9) {
                    setState(() {
                      val_9 = value_9 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "10.Shape of face",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Long, angular,Thin",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_10,
                  onChanged: (value_10) {
                    setState(() {
                      val_10 = value_10 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Heart-shaped,pointed chin",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_10,
                  onChanged: (value_10) {
                    setState(() {
                      val_10 = value_10 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Large, round, Full",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_10,
                  onChanged: (value_10) {
                    setState(() {
                      val_10 = value_10 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "11. Eyes",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Small, active, darting, dark eyes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_11,
                  onChanged: (value_11) {
                    setState(() {
                      val_11 = value_11 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Medium sized, penetrating, light sensetivity eyes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_11,
                  onChanged: (value_11) {
                    setState(() {
                      val_11 = value_11 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Big, round, beautiful glowing eyes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_11,
                  onChanged: (value_11) {
                    setState(() {
                      val_11 = value_11 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "12.Eyelashes",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Scanty eye lashes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_12,
                  onChanged: (value_12) {
                    setState(() {
                      val_12 = value_12 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Moderate eye lashes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_12,
                  onChanged: (value_12) {
                    setState(() {
                      val_12 = value_12 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Thick/ Fused eye lashes",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_12,
                  onChanged: (value_12) {
                    setState(() {
                      val_12 = value_12 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "13.Blinking of Eyes",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Excessive Blinking",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_13,
                  onChanged: (value_13) {
                    setState(() {
                      val_13 = value_13 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Moderate Blinking",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_13,
                  onChanged: (value_13) {
                    setState(() {
                      val_13 = value_13 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "More or less stable",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_13,
                  onChanged: (value_13) {
                    setState(() {
                      val_13 = value_13 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "14.Cheeks",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Wrinkled, Sunken",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_14,
                  onChanged: (value_14) {
                    setState(() {
                      val_14 = value_14 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Smooth, Flat",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_14,
                  onChanged: (value_14) {
                    setState(() {
                      val_14 = value_14 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Rounded, Plump",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_14,
                  onChanged: (value_14) {
                    setState(() {
                      val_14 = value_14 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "15.Nose",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Crooked, Narrow, small",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_15,
                  onChanged: (value_15) {
                    setState(() {
                      val_15 = value_15 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Pointed, Average",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_15,
                  onChanged: (value_15) {
                    setState(() {
                      val_15 = value_15 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Rounded, Large open nostrils",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_15,
                  onChanged: (value_15) {
                    setState(() {
                      val_15 = value_15 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "16.Teeth and gums",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Irregular, Protruding teeth, Receding gums",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_16,
                  onChanged: (value_16) {
                    setState(() {
                      val_16 = value_16 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Medium sized teeth, Reddish gums",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_16,
                  onChanged: (value_16) {
                    setState(() {
                      val_16 = value_16 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Big, White, Strong teeth, Healthy gums",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_16,
                  onChanged: (value_16) {
                    setState(() {
                      val_16 = value_16 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "17. Lips",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Tight, thin, dry lips which chaps easil",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_17,
                  onChanged: (value_17) {
                    setState(() {
                      val_17 = value_17 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Lips are soft, medium-sized",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_17,
                  onChanged: (value_17) {
                    setState(() {
                      val_17 = value_17 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Lips are large, soft, pink and full",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_17,
                  onChanged: (value_17) {
                    setState(() {
                      val_17 = value_17 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "18.Nails",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Dry, Rough, Brittle, Break easily",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_18,
                  onChanged: (value_18) {
                    setState(() {
                      val_18 = value_18 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Sharp, Flexible, pink, Lustrous",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_18,
                  onChanged: (value_18) {
                    setState(() {
                      val_18 = value_18 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Thick, Oily, Smooth, Polished",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_18,
                  onChanged: (value_18) {
                    setState(() {
                      val_18 = value_18 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "19.Appetite",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Irregular, Scanty",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_19,
                  onChanged: (value_19) {
                    setState(() {
                      val_19 = value_19 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Strong, Unbearable",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_19,
                  onChanged: (value_19) {
                    setState(() {
                      val_19 = value_19 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Slow but steady",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_19,
                  onChanged: (value_19) {
                    setState(() {
                      val_19 = value_19 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: const <Widget>[
                  SizedBox(width: 20),
                  Text(
                    "20.Liking tastes",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text(
                  "Sweet / Sour / Salty",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 0.0,
                  groupValue: val_20,
                  onChanged: (value_20) {
                    setState(() {
                      val_20 = value_20 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Sweet / Bitter / Astringent",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 1.0,
                  groupValue: val_20,
                  onChanged: (value_20) {
                    setState(() {
                      val_20 = value_20 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              ListTile(
                title: const Text(
                  "Pungent / Bitter / Astringent",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: 2.0,
                  groupValue: val_20,
                  onChanged: (value_20) {
                    setState(() {
                      val_20 = value_20 as double;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                  child: SizedBox(
                child: submitQuizButton,
                height: 50,
                width: 100,
              )),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

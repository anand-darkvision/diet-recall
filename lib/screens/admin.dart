// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/providers/google_sign_in.dart';
import 'package:dietrecallapp/screens/dietician_eval.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  //firestore cloud storage
  FirebaseFirestore Firestore = FirebaseFirestore.instance;

  //text field
  final TextEditingController _food = TextEditingController();
  String food = '';

  //breakfast snacks
  bool value = false;
  int val = -1;
  //breakfast
  bool value_1 = false;
  int val_1 = -1;
  //lunch
  bool value_2 = false;
  int val_2 = -1;
  //sidedish
  bool value_4 = false;
  int val_4 = -1;
  //evening snacks
  bool value_5 = false;
  int val_5 = -1;
  //dinner
  bool value_6 = false;
  int val_6 = -1;

  //vata
  bool value_7 = false;
  int val_7 = -1;
  //pitta
  bool value_8 = false;
  int val_8 = -1;
  //kapha
  bool value_9 = false;
  int val_9 = -1;

  String breakFastSnacks() {
    if (val == 1) {
      return 'breakfast_snacks';
    } else {
      return 'null';
    }
  }

  String breakFast() {
    if (val_1 == 1) {
      return 'breakfast';
    } else {
      return 'null';
    }
  }

  String lunch() {
    if (val_2 == 1) {
      return 'lunch';
    } else {
      return 'null';
    }
  }

  String sideDish() {
    if (val_4 == 1) {
      return 'sideDish';
    } else {
      return 'null';
    }
  }

  String eveningSnack() {
    if (val_5 == 1) {
      return 'evening_snacks';
    } else {
      return 'null';
    }
  }

  String dinner() {
    if (val_6 == 1) {
      return 'dinner';
    } else {
      return 'null';
    }
  }

  String vata() {
    if (val_7 == 1) {
      return 'vata';
    } else {
      return 'null';
    }
  }

  String pitta() {
    if (val_8 == 1) {
      return 'pitta';
    } else {
      return 'null';
    }
  }

  String kapha() {
    if (val_9 == 1) {
      return 'kapha';
    } else {
      return 'null';
    }
  }

  foodVataADD() {
    if (vata() == 'vata') {
      if (breakFast() == 'breakfast') {
        Firestore.collection("VataFood").doc("Vata").set({
          'BreakFast': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (breakFastSnacks() == 'breakfast_snacks') {
        Firestore.collection("VataFood").doc("Vata").set({
          'BreakFast Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (lunch() == 'lunch') {
        Firestore.collection("VataFood").doc("Vata").set({
          'Lunch': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (sideDish() == 'sideDish') {
        Firestore.collection("VataFood").doc("Vata").set({
          'SideDish': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (eveningSnack() == 'evening_snacks') {
        Firestore.collection("VataFood").doc("Vata").set({
          'Evening Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (dinner() == 'dinner') {
        Firestore.collection("VataFood").doc("Vata").set({
          'Dinner': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
    }

    if (pitta() == 'pitta') {
      if (breakFast() == 'breakfast') {
        Firestore.collection("PittaFood").doc("pitta").set({
          'BreakFast': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }

      if (breakFastSnacks() == 'breakfast_snacks') {
        Firestore.collection("PittaFood").doc("pitta").set({
          'BreakFast Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (lunch() == 'lunch') {
        Firestore.collection("PittaFood").doc("pitta").set({
          'Lunch': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (sideDish() == 'sideDish') {
        Firestore.collection("PittaFood").doc("pitta").set({
          'Side Dish': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (eveningSnack() == 'evening_snacks') {
        Firestore.collection("PittaFood").doc("pitta").set({
          'Evening Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (dinner() == 'dinner') {
        Firestore.collection("PittaFood").doc("pitta").set({
          'Dinner': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
    }

    if (kapha() == 'kapha') {
      if (breakFast() == 'breakfast') {
        Firestore.collection("KaphaFood").doc("kapha").set({
          'BreakFast': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (breakFastSnacks() == 'breakfast_snacks') {
        Firestore.collection("KaphaFood").doc("kapha").set({
          'BreakFast Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (lunch() == 'lunch') {
        Firestore.collection("KaphaFood").doc("kapha").set({
          'Lunch': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (sideDish() == 'sideDish') {
        Firestore.collection("KaphaFood").doc("kapha").set({
          'SideDish': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (eveningSnack() == 'evening_snacks') {
        Firestore.collection("KaphaFood").doc("kapha").set({
          'Evening Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (dinner() == 'dinner') {
        Firestore.collection("KaphaFood").doc("kapha").set({
          'Dinner': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
    }
    if (vata() == 'vata' && pitta() == 'pitta') {
      if (breakFast() == 'breakfast') {
        Firestore.collection("VataPittaFood").doc("vatapitta").set({
          'BreakFast': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (breakFastSnacks() == 'breakfast_snacks') {
        Firestore.collection("VataPittaFood").doc("vatapitta").set({
          'BreakFast Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (lunch() == 'lunch') {
        Firestore.collection("VataPittaFood").doc("vatapitta").set({
          'Lunch': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (sideDish() == 'sideDish') {
        Firestore.collection("VataPittaFood").doc("vatapitta").set({
          'SideDish': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (eveningSnack() == 'evening_snacks') {
        Firestore.collection("VataPittaFood").doc("vatapitta").set({
          'Evening Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (dinner() == 'dinner') {
        Firestore.collection("VataPittaFood").doc("vatapitta").set({
          'Dinner': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
    }
    if (vata() == 'vata' && kapha() == 'kapha') {
      if (breakFast() == 'breakfast') {
        Firestore.collection("VataKaphaFood").doc("vatakapha").set({
          'BreakFast': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (breakFastSnacks() == 'breakfast_snacks') {
        Firestore.collection("VataKaphaFood").doc("vatakapha").set({
          'BreakFast Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (lunch() == 'lunch') {
        Firestore.collection("VataKaphaFood").doc("vatakapha").set({
          'Lunch': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (sideDish() == 'sideDish') {
        Firestore.collection("VataKaphaFood").doc("vatakapha").set({
          'SideDish': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (eveningSnack() == 'evening_snacks') {
        Firestore.collection("VataKaphaFood").doc("vatakapha").set({
          'Evening Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (dinner() == 'dinner') {
        Firestore.collection("VataKaphaFood").doc("vatakapha").set({
          'Dinner': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
    }
    if (pitta() == 'pitta' && kapha() == 'kapha') {
      if (breakFast() == 'breakfast') {
        Firestore.collection("PittaKaphaFood").doc("pittakapha").set({
          'BreakFast': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (breakFastSnacks() == 'breakfast_snacks') {
        Firestore.collection("PittaKaphaFood").doc("pittakapha").set({
          'BreakFast Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (lunch() == 'lunch') {
        Firestore.collection("PittaKaphaFood").doc("pittakapha").set({
          'Lunch': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (sideDish() == 'sideDish') {
        Firestore.collection("PittaKaphaFood").doc("pittakapha").set({
          'SideDish': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (eveningSnack() == 'evening_snacks') {
        Firestore.collection("PittaKaphaFood").doc("pittakapha").set({
          'Evening Snacks': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
      if (dinner() == 'dinner') {
        Firestore.collection("PittaKaphaFood").doc("pittakapha").set({
          'Dinner': FieldValue.arrayUnion([
            _food.text,
          ]),
        }, SetOptions(merge: true));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AddRecord = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () async {
            await foodVataADD();
            setState(() {
              val = -1;
              val_1 = -1;
              val_2 = -1;
              val_4 = -1;
              val_5 = -1;
              val_6 = -1;
              val_7 = -1;
              val_8 = -1;
              val_9 = -1;
            });
            _food.clear();

            print("Added suceesfully");
          },
          child: const Text(
            "Add",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "Sharetech"),
          )),
    );
    final foodField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _food,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onChanged: (text) {
        food = text;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 2,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        focusColor: Colors.black,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "food",
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Colors.black,
            width: 20,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
    return SafeArea(
      child: Scaffold(
          drawer: SizedBox(
            width: 230,
            child: Drawer(
              backgroundColor: Colors.white,
              elevation: 0.0,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    width: 200,
                    child: Center(
                      child: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 168, 184, 139),
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: 210,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DieticianEval()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              SizedBox(width: 0.0),
                              Icon(
                                Icons.book_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "DIETICIAN EVAL",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 55,
                    width: 200,
                    child: Center(
                      child: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 168, 184, 139),
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: 210,
                          onPressed: () {
                            super.dispose();
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.logOut(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              SizedBox(width: 0.0),
                              Icon(
                                Icons.logout,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "LOGOUT",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              "Admin Page",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 168, 184, 139),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 40),
                      Text(
                        "Food",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 30),
                      SizedBox(height: 60, width: 290, child: foodField),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(children: const <Widget>[
                    SizedBox(width: 40),
                    Text(
                      "Food Time",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 30),
                  Row(children: const <Widget>[
                    SizedBox(width: 30),
                    Text(
                      "Morning Snack",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "BreakFast",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      "Lunch",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 30),
                  Row(children: <Widget>[
                    const SizedBox(width: 35),
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
                    const SizedBox(width: 80),
                    Radio(
                      value: 1,
                      groupValue: val_1,
                      onChanged: (value) {
                        setState(() {
                          val_1 = value as int;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    const SizedBox(width: 70),
                    Radio(
                      value: 1,
                      groupValue: val_2,
                      onChanged: (value) {
                        setState(() {
                          val_2 = value as int;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ]),
                  const SizedBox(height: 30),
                  Row(children: const <Widget>[
                    SizedBox(width: 30),
                    Text(
                      "SideDish",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 30),
                    Text(
                      "Evening Snacks",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 50),
                    Text(
                      "Dinner",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 30),
                  Row(children: <Widget>[
                    const SizedBox(width: 35),
                    Radio(
                      value: 1,
                      groupValue: val_4,
                      onChanged: (value) {
                        setState(() {
                          val_4 = value as int;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    const SizedBox(width: 80),
                    Radio(
                      value: 1,
                      groupValue: val_5,
                      onChanged: (value) {
                        setState(() {
                          val_5 = value as int;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    const SizedBox(width: 70),
                    Radio(
                      value: 1,
                      groupValue: val_6,
                      onChanged: (value) {
                        setState(() {
                          val_6 = value as int;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                  ]),
                  const SizedBox(height: 20),
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 40),
                      Text(
                        "Body Type",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(children: const <Widget>[
                    SizedBox(width: 50),
                    Text(
                      "Vata",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 90),
                    Text(
                      "Pitta",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 80),
                    Text(
                      "Kapha",
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      const SizedBox(width: 35),
                      Radio(
                        value: 1,
                        groupValue: val_7,
                        onChanged: (value) {
                          setState(() {
                            val_7 = value as int;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const SizedBox(width: 80),
                      Radio(
                        value: 1,
                        groupValue: val_8,
                        onChanged: (value) {
                          setState(() {
                            val_8 = value as int;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const SizedBox(width: 70),
                      Radio(
                        value: 1,
                        groupValue: val_9,
                        onChanged: (value) {
                          setState(() {
                            val_9 = value as int;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: AddRecord,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

//  {
//       'ledger': FieldValue.arrayUnion([
//         {
//           "date": DateTime.now(),
//           "amount": amountDouble,
//         },
//       ]),
//       'saved': FieldValue.increment(amountDouble)
//     };

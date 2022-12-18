// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../usermodel/breakfast_user_model.dart';
import '../usermodel/dinner_user_model.dart';
import '../usermodel/evening_user_model.dart';
import '../usermodel/lunch_user_model.dart';
import '../usermodel/moringsnack_user_model.dart';

class DailyProtien extends StatefulWidget {
  const DailyProtien({Key? key}) : super(key: key);

  @override
  State<DailyProtien> createState() => _DailyProtienState();
}

class _DailyProtienState extends State<DailyProtien> {
  @override
  Widget build(BuildContext context) {
    Hive.openBox("recall");
    Hive.openBox("morningSnack");
    Hive.openBox("lunch");
    Hive.openBox("evening");
    Hive.openBox("dinner");
    var box = Hive.box('recall');
    var box1 = Hive.box('morningSnack');
    var box2 = Hive.box('lunch');
    var box3 = Hive.box('evening');
    var box4 = Hive.box('dinner');
    return Scaffold(
        body: Column(
      children: [
        box.isNotEmpty
            ? Expanded(child: _BreakfastView())
            : const Text("No BreakFast Data Found!!!!"),
        box1.isNotEmpty
            ? Expanded(child: _MorningSnackView())
            : const Text("No Break Fast Data Found!!!!"),
        box2.isNotEmpty
            ? Expanded(child: _lunchview())
            : const Text("No Lunch Data Found!!!!"),
        box3.isNotEmpty
            ? Expanded(child: _eveSnackView())
            : const Text("No Evening Snack Data Found!!!!"),
        box4.isNotEmpty
            ? _dinnerview()
            : const Text("No Dinner Data Found!!!!"),
      ],
    ));
  }

  Widget _BreakfastView() {
    return WatchBoxBuilder(
      box: Hive.box('recall'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as Breakfast_Contact;
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 370,
                    height: 220,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.grey[200],
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 23),
                          Text(
                            contact_break.breakFastFood,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            contact_break.breakFastServings.toString(),
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            contact_break.breakFastDrinks,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            contact_break.breakFastGlass.toString(),
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              const SizedBox(width: 250),
                              IconButton(
                                onPressed: () {
                                  contactsBox.deleteAt(index);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _MorningSnackView() {
    return WatchBoxBuilder(
      box: Hive.box('morningSnack'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break =
                contactsBox.getAt(index) as Morningsnack_Contact;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 300,
                height: 220,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 23),
                      Text(
                        contact_break.morningSnackFood,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.morningSnackServings.toString(),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.morningSnackDrinks,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.morningSnackGlass.toString(),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 250),
                          IconButton(
                            onPressed: () {
                              contactsBox.deleteAt(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _lunchview() {
    return WatchBoxBuilder(
      box: Hive.box('lunch'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as lunch_Contact;

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 300,
                height: 191,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 23),
                      Text(
                        contact_break.lunchFood,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.lunchServings.toString(),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.lunchDrinks,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.lunchGlass.toString(),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 250),
                          IconButton(
                            onPressed: () {
                              contactsBox.deleteAt(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _eveSnackView() {
    return WatchBoxBuilder(
      box: Hive.box('evening'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as evening_Contact;

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 300,
                height: 191,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 23),
                      Text(
                        contact_break.eveningFood,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.eveningServings.toString(),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.eveningDrinks,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.eveningGlass.toString(),
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 250),
                          IconButton(
                            onPressed: () {
                              contactsBox.deleteAt(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _dinnerview() {
    return WatchBoxBuilder(
      box: Hive.box('dinner'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as Dinner_Contact;

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 300,
                height: 191,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 23),
                      Text(
                        contact_break.dinnerFood,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.dinnerServings.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.dinnerDrinks.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        contact_break.dinnerGlass.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 250),
                          IconButton(
                            onPressed: () {
                              contactsBox.deleteAt(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

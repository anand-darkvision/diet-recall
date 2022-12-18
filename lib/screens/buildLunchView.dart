// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:dietrecallapp/Dataset/lunch_dataset.dart';
import 'package:dietrecallapp/Dataset/snack_dataset.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../usermodel/lunch_user_model.dart';

class LunchViewBuild extends StatefulWidget {
  const LunchViewBuild({Key? key}) : super(key: key);

  @override
  State<LunchViewBuild> createState() => _LunchViewBuildState();
}

class _LunchViewBuildState extends State<LunchViewBuild> {
  var _fooItem;
  var _juItem;
  String error = "No Data";

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  void _fooclearfun() {
    setState(() {
      _fooItem = 0;
    });
  }

  void _juclearfun() {
    setState(() {
      _juItem = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var b1 = Lunch_dataset().getlunch();
    var b2 = Lunch_dataset().getlunchcal();

    var c1 = Snacks_dataset().getsnacks();
    var c2 = Snacks_dataset().getsnackcal();

    setState(() {});

    return WatchBoxBuilder(
      box: Hive.box('lunch'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as lunch_Contact;

            fg() {
              for (int i = 1; i <= 15; i++) {
                if (contact_break.lunchFood == b1[i]) {
                  _fooItem = b2[i];
                  _fooclearfun;
                }
              }
            }

            hj() {
              for (int i = 1; i <= 22; i++) {
                if (contact_break.lunchDrinks == c1[i]) {
                  _juItem = c2[i];
                  _juclearfun;
                }
              }
            }

            (contact_break.lunchFood.contains('0')) ? null : fg();
            (contact_break.lunchDrinks.contains('0')) ? null : hj();

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 300,
                height: 210,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 23),
                      Text(
                        (contact_break.lunchFood.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.lunchFood}   Calorie:$_fooItem", //* contact_break.lunchServings}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.lunchServings.toString().isEmpty)
                            ? "Servings : No data"
                            : "Servings : ${contact_break.lunchServings.toString()}",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.lunchDrinks.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.lunchDrinks}   Calorie:$_juItem", //* contact_break.lunchGlass}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.lunchGlass.toString().isEmpty)
                            ? "Servings : No data"
                            : "Servings : ${contact_break.lunchGlass.toString()}",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 300),
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

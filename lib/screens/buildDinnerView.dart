// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:dietrecallapp/Dataset/dinner_dataset.dart';
import 'package:dietrecallapp/Dataset/snack_dataset.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../usermodel/dinner_user_model.dart';

class DinnerView extends StatefulWidget {
  const DinnerView({Key? key}) : super(key: key);

  @override
  State<DinnerView> createState() => _DinnerViewState();
}

class _DinnerViewState extends State<DinnerView> {
  var _fooItem;
  var _juItem;

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
    var a1 = Dinners_dataset().getdinner();
    var a2 = Dinners_dataset().getdinnercal();

    var b1 = Snacks_dataset().getsnacks();
    var b2 = Snacks_dataset().getsnackcal();

    setState(() {});

    return WatchBoxBuilder(
      box: Hive.box('dinner'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as Dinner_Contact;

            food() {
              for (int i = 1; i <= 11; i++) {
                if (contact_break.dinnerFood == a1[i]) {
                  _fooItem = a2[i];
                  _fooclearfun;
                }
              }
            }

            drink() {
              for (int i = 1; i <= 22; i++) {
                if (contact_break.dinnerDrinks == b1[i]) {
                  _juItem = b2[i];
                  _juclearfun;
                }
              }
            }

            (contact_break.dinnerFood.contains('0')) ? null : food();
            (contact_break.dinnerDrinks.contains('0')) ? null : drink();

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
                        (contact_break.dinnerFood.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.dinnerFood}   Calorie:$_fooItem", //* contact_break.dinnerServings}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.dinnerServings.toString().isEmpty)
                            ? "Servings : No data"
                            : "Serving : ${contact_break.dinnerServings.toString()}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.dinnerDrinks.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.dinnerDrinks}   Calorie:$_juItem", // * contact_break.dinnerGlass}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.dinnerGlass.toString().isEmpty)
                            ? "Servings : No data"
                            : "Serving : ${contact_break.dinnerGlass.toString()}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
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

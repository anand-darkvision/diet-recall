// ignore_for_file: deprecated_member_use, non_constant_identifier_names, unnecessary_import, prefer_typing_uninitialized_variables

import 'package:dietrecallapp/Dataset/snack_dataset.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../usermodel/evening_user_model.dart';

class EveningView extends StatefulWidget {
  const EveningView({Key? key}) : super(key: key);

  @override
  State<EveningView> createState() => _EveningViewState();
}

class _EveningViewState extends State<EveningView> {
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
    var b1 = Snacks_dataset().getsnacks();
    var b2 = Snacks_dataset().getsnackcal();
    setState(() {});
    return WatchBoxBuilder(
      box: Hive.box('evening'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as evening_Contact;

            food() {
              for (int i = 1; i <= 22; i++) {
                if (contact_break.eveningFood == b1[i]) {
                  _fooItem = b2[i];
                  _fooclearfun;
                }
              }
            }

            drinks() {
              for (int i = 1; i <= 22; i++) {
                if (contact_break.eveningDrinks == b1[i]) {
                  _juItem = b2[i];
                  _juclearfun;
                }
              }
            }

            (contact_break.eveningFood.contains('0')) ? null : food();
            (contact_break.eveningDrinks.contains('0')) ? null : drinks();

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
                        (contact_break.eveningFood.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.eveningFood}   Calorie:$_fooItem", //,* contact_break.eveningServings}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.eveningServings.toString().isEmpty)
                            ? "Servings : No data"
                            : "Servings : ${contact_break.eveningServings.toString()}",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.eveningDrinks.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.eveningDrinks}   Calorie:$_juItem", //* contact_break.eveningGlass}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.eveningGlass.toString().isEmpty)
                            ? "Servings : No data"
                            : "Servings : ${contact_break.eveningGlass.toString()}",
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

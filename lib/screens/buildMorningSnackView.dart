// ignore: file_names
// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:dietrecallapp/Dataset/snack_dataset.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../usermodel/moringsnack_user_model.dart';

class MorningSnackBuild extends StatefulWidget {
  const MorningSnackBuild({Key? key}) : super(key: key);

  @override
  State<MorningSnackBuild> createState() => _MorningSnackBuildState();
}

class _MorningSnackBuildState extends State<MorningSnackBuild> {
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
      box: Hive.box('morningSnack'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break =
                contactsBox.getAt(index) as Morningsnack_Contact;

            food() {
              for (int i = 1; i <= 23; i++) {
                if (contact_break.morningSnackFood == b1[i]) {
                  _fooItem = b2[i];
                  _fooclearfun;
                }
              }
            }

            drink() {
              for (int i = 1; i <= 23; i++) {
                if (contact_break.morningSnackDrinks == b1[i]) {
                  _juItem = b2[i];
                  _juclearfun;
                }
              }
            }

            (contact_break.morningSnackFood.contains('0')) ? null : food();
            (contact_break.morningSnackDrinks.contains('0')) ? null : drink();

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: 300,
                height: 210,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 23),
                      Text(
                        (contact_break.morningSnackFood.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.morningSnackFood}   Calorie:$_fooItem", //* contact_break.morningSnackServings}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.morningSnackServings
                                .toString()
                                .contains('0'))
                            ? "Serving : No data"
                            : "Serving:${contact_break.morningSnackServings.toString()}",
                        style: const TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.morningSnackDrinks.isEmpty)
                            ? "Food:No data   Calorie:No data"
                            : "Food:${contact_break.morningSnackDrinks}   Calorie:$_juItem", // * contact_break.morningSnackGlass}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        (contact_break.morningSnackGlass.toString().isEmpty)
                            ? "Servings: No data"
                            : "Servings:${contact_break.morningSnackGlass.toString()}",
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

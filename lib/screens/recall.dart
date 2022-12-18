// ignore_for_file: non_constant_identifier_names, deprecated_member_use, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/Dataset/breakfast_dataset.dart';
import 'package:dietrecallapp/Dataset/snack_dataset.dart';
import 'package:dietrecallapp/Nutrition_screen/Dinner.dart';
import 'package:dietrecallapp/Nutrition_screen/evening.dart';
import 'package:dietrecallapp/Nutrition_screen/lunch.dart';
import 'package:dietrecallapp/Nutrition_screen/morningsnack.dart';
import 'package:dietrecallapp/screens/buildDinnerView.dart';
import 'package:dietrecallapp/screens/buildEveningView.dart';
import 'package:dietrecallapp/screens/buildLunchView.dart';
import 'package:dietrecallapp/screens/buildMorningSnackView.dart';
import 'package:dietrecallapp/usermodel/breakfast_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../Nutrition_screen/breakfast.dart';
import 'homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Recall extends StatefulWidget {
  const Recall({Key? key}) : super(key: key);

  @override
  State<Recall> createState() => _RecallState();
}

class _RecallState extends State<Recall> {
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

  Widget _buildBreakfastView() {
    FirebaseFirestore Firestore = FirebaseFirestore.instance;

    User? user = FirebaseAuth.instance.currentUser!;

    var a1 = BreakFast_dataset().getbreakfast();
    var a2 = BreakFast_dataset().getbreakfastcal();

    var b1 = Snacks_dataset().getsnacks();
    var b2 = Snacks_dataset().getsnackcal();

    setState(() {});
    return WatchBoxBuilder(
      box: Hive.box('recall'),
      builder: (context, contactsBox) {
        return ListView.builder(
          itemCount: contactsBox.length,
          itemBuilder: (context, index) {
            final contact_break = contactsBox.getAt(index) as Breakfast_Contact;

            // 13 is no of item in dataset

            food() {
              for (int i = 1; i <= 13; i++) {
                if (contact_break.breakFastFood == a1[i]) {
                  _fooItem = a2[i];
                  _fooclearfun;
                }
              }
            }

            juice() {
              for (int i = 1; i <= 23; i++) {
                if (contact_break.breakFastDrinks == b1[i]) {
                  _juItem = b2[i];
                  _juclearfun;
                }
              }
            }

            (contact_break.breakFastFood.contains('0')) ? null : food();

            // 22 is no of item in dataset
            (contact_break.breakFastDrinks.contains('0')) ? null : food();

            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 370,
                    height: 220,
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
                            (contact_break.breakFastFood.isEmpty)
                                ? "Food:No data   Calorie:No data"
                                : "Food:${contact_break.breakFastFood}   calorie:$_fooItem", //* contact_break.breakFastServings}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (contact_break.breakFastServings.toString().isEmpty)
                                ? "Servings : No data"
                                : "Servings : ${contact_break.breakFastServings.toString()}",
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (contact_break.breakFastDrinks.isEmpty)
                                ? "Drinks:No Data    calorie:No Data"
                                : "Drink:${contact_break.breakFastDrinks}   calorie:$_juItem",
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            (contact_break.breakFastGlass.toString().isEmpty)
                                ? "Servings:No Data"
                                : "Servings:${contact_break.breakFastGlass}",
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              const SizedBox(width: 310),
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

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: SizedBox(
          width: 230,
          child: Drawer(
            elevation: 0.0,
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 65,
                    color: const Color.fromARGB(255, 168, 184, 139),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 0,
                    height: 0,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 100,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const MorningSnacks()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 40),
                          Center(
                            child: Text(
                              "${t?.mornsnacks}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const BreakFast()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 41),
                          Text(
                            "${t?.breakfast}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Lunch()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 41),
                          Text(
                            "${t?.lunch}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const EveningMeal()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 48),
                          Text(
                            "${t?.evenin}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Dinner()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 51),
                          Text(
                            "${t?.dinne}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 410),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 0,
                    color: Colors.grey[200],
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 41),
                          Text(
                            "${t?.bactohom}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.brightness_low_sharp,
                color: Colors.black,
              )),
              Tab(icon: Icon(Icons.brightness_7, color: Colors.black)),
              Tab(icon: Icon(Icons.brightness_1_rounded, color: Colors.black)),
              Tab(icon: Icon(Icons.brightness_4_outlined, color: Colors.black)),
              Tab(icon: Icon(Icons.brightness_3, color: Colors.black)),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
          title: Text(
            "${t?.recall}",
            style: const TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            const MorningSnackBuild(),
            _buildBreakfastView(),
            const LunchViewBuild(),
            const EveningView(),
            const DinnerView(),
          ],
        ),
      ),
    );
  }
}

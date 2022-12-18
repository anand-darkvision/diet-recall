// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/screens/morning_snack_prediction.dart';
import 'package:dietrecallapp/screens/recall.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import '../usermodel/moringsnack_user_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MorningSnacks extends StatefulWidget {
  const MorningSnacks({Key? key}) : super(key: key);

  @override
  State<MorningSnacks> createState() => _MorningSnacksState();
}

FirebaseFirestore Firestore = FirebaseFirestore.instance;

User? user = FirebaseAuth.instance.currentUser!;

TextEditingController _food = TextEditingController();
TextEditingController _servings = TextEditingController();
TextEditingController _drinks = TextEditingController();
TextEditingController _glass = TextEditingController();
String food = '';
String servings = '';
String drinks = '';
String glass = '';

class _MorningSnacksState extends State<MorningSnacks> {
  var imagePicker;
  var type;

  // for ml

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  void addBreakFood(Morningsnack_Contact contact) {
    final contactBox = Hive.box('morningSnack');
    contactBox.add(contact);
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final drinkField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _drinks,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
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
        hintText: "${t?.drinks}",
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

    final glassField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _glass,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
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
        hintText: "${t?.glass}",
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

    final foodField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _food,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
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
        hintText: "${t?.glass}",
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

    final servingsField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _servings,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
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
        hintText: "${t?.serving}",
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

    final addMoreButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () async {
            DateTime dateToday = DateTime.now();
            String date = dateToday.toString().substring(0, 10);
            await Firestore.collection('users').doc(user?.uid).set({
              date: FieldValue.arrayUnion([
                {
                  "food": _food.text,
                  "juice": _drinks.text,
                },
              ]),
            }, SetOptions(merge: true));
            Hive.openBox("morningSnack");
            final newContact = Morningsnack_Contact(
                _food.text,
                int.parse(_servings.text),
                _drinks.text,
                int.parse(_glass.text));
            addBreakFood(newContact);
            _food.clear();
            _servings.clear();
            _drinks.clear();
            _glass.clear();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MorningSnacks()));
          },
          child: Text(
            "${t?.addmo}",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "Sharetech"),
          )),
    );

    final submitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () async {
            DateTime dateToday = DateTime.now();
            String date = dateToday.toString().substring(0, 10);
            await Firestore.collection('users').doc(user?.uid).set({
              date: FieldValue.arrayUnion([
                {
                  "food": _food.text,
                  "juice": _drinks.text,
                },
              ]),
            }, SetOptions(merge: true));
            Hive.openBox("morningSnack");
            final newContact = Morningsnack_Contact(
                _food.text,
                int.parse(_servings.text),
                _drinks.text,
                int.parse(_glass.text));
            addBreakFood(newContact);
            _food.clear();
            _servings.clear();
            _drinks.clear();
            _glass.clear();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Recall()));
          },
          child: Text(
            "${t?.submit}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "Sharetech"),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton.icon(
            onPressed: () {
              _food.clear();
              _servings.clear();
              _drinks.clear();
              _glass.clear();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Recall()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            label: const Text("")),
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  const SizedBox(width: 87),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 40,
                    width: 200,
                    child: Center(
                      child: Text(
                        "${t?.mornsnacks}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const TfliteModel()));
                    },
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      size: 35,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "${t?.whatdidyouaddformorningsnack}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  const SizedBox(width: 85),
                  Text(
                    "${t?.food}",
                    style: const TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    "${t?.serving}",
                    style: const TextStyle(
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
                  const SizedBox(width: 65),
                  SizedBox(
                    child: foodField,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(width: 75),
                  SizedBox(
                    child: servingsField,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: <Widget>[
                  const SizedBox(width: 85),
                  Text(
                    "${t?.drinks}",
                    style: const TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Text(
                    "${t?.glass}",
                    style: const TextStyle(
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
                  const SizedBox(width: 65),
                  SizedBox(
                    child: drinkField,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(width: 75),
                  SizedBox(
                    child: glassField,
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: addMoreButton,
                width: 150,
                height: 50,
              ),
              const SizedBox(height: 40),
              SizedBox(
                child: submitButton,
                width: 200,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

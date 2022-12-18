import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/providers/dietician_model.dart';
import 'package:dietrecallapp/providers/user_model.dart';
import 'package:dietrecallapp/screens/LoginPage.dart';
import 'package:dietrecallapp/screens/dietician_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'homepage.dart';

class PageSwitcher extends StatefulWidget {
  const PageSwitcher({Key? key}) : super(key: key);

  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser;
  DieticianModel dietician = DieticianModel();

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    FirebaseFirestore.instance
        .collection("dietician")
        .doc(user?.uid)
        .get()
        .then((value1) {
      dietician = DieticianModel.fromMap(value1.data());
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("some error");
              } else if (snapshot.hasData) {
                if (dietician.uid == user?.uid) {
                  return FutureBuilder(
                      future: _fetchHive(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return const DieticianPage();
                          }
                        } else {
                          return const Scaffold();
                        }
                      });
                } else {
                  return FutureBuilder(
                      future: _fetchHive(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return const HomePage();
                          }
                        } else {
                          return const Scaffold();
                        }
                      });
                }
              } else if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              } else {
                return const LoginPage();
              }
            }),
      );
  _fetchHive() async {
    await Hive.openBox("recall");
    await Hive.openBox("morningSnack");
    await Hive.openBox("lunch");
    await Hive.openBox("evening");
    await Hive.openBox("dinner");
    await Hive.openBox("vatpit");
    await Hive.openBox("warning");
    await Hive.openBox("bodytype");
    await Hive.openBox("vatafood");
    await Hive.openBox("water");
    await Hive.openBox("point");
  }
}

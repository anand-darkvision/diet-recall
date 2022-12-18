// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/providers/dietician_model.dart';
import 'package:dietrecallapp/providers/user_model.dart';
import 'package:dietrecallapp/screens/LoginPage.dart';
import 'package:dietrecallapp/screens/admin.dart';
import 'package:dietrecallapp/screens/diertecian.dart';
import 'package:dietrecallapp/screens/dietician_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

class DieticianEval extends StatefulWidget {
  const DieticianEval({Key? key}) : super(key: key);

  @override
  State<DieticianEval> createState() => _DieticianEvalState();
}

class _DieticianEvalState extends State<DieticianEval> {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  DieticianModel loggedInUser = DieticianModel();

  List<dynamic> Name = <dynamic>[];
  List<dynamic> email = <dynamic>[];
  List<dynamic> pracid = <dynamic>[];
  List<dynamic> loc = <dynamic>[];
  List<dynamic> edu = <dynamic>[];
  List<dynamic> pass = <dynamic>[];
  List<dynamic> uid = <dynamic>[];

  final _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    getData();
    super.initState();
  }

  bool value = false;
  int val = -1;

  Future<void> getData() async {
    //kapha --- food store ---
    QuerySnapshot querySnapshot = await _fireStore
        .collection('users')
        .doc('fIQfFP1vsVQWsE1sCBe5hYM3h8D2')
        .collection('dietician_eval')
        .get();
    final allaData = querySnapshot.docs.map((doc) => doc.get("Name")).toList();
    setState(() {
      Name = allaData;
    });

    QuerySnapshot query1Snapshot = await _fireStore
        .collection('users')
        .doc('fIQfFP1vsVQWsE1sCBe5hYM3h8D2')
        .collection('dietician_eval')
        .get();
    final allbData =
        query1Snapshot.docs.map((doc) => doc.get("email")).toList();
    setState(() {
      email = allbData;
    });

    QuerySnapshot query2Snapshot = await _fireStore
        .collection('users')
        .doc('fIQfFP1vsVQWsE1sCBe5hYM3h8D2')
        .collection('dietician_eval')
        .get();
    final allcData =
        query2Snapshot.docs.map((doc) => doc.get("PractionerId")).toList();

    setState(() {
      pracid = allcData;
    });
    QuerySnapshot query3Snapshot = await _fireStore
        .collection('users')
        .doc('fIQfFP1vsVQWsE1sCBe5hYM3h8D2')
        .collection('dietician_eval')
        .get();
    final alldData =
        query3Snapshot.docs.map((doc) => doc.get("Location")).toList();
    setState(() {
      loc = alldData;
    });

    QuerySnapshot query4Snapshot = await _fireStore
        .collection('users')
        .doc('fIQfFP1vsVQWsE1sCBe5hYM3h8D2')
        .collection('dietician_eval')
        .get();
    final alleData = query4Snapshot.docs
        .map((doc) => doc.get("Educational_Qualification"))
        .toList();
    setState(() {
      edu = alleData;
    });

    QuerySnapshot query5Snapshot = await _fireStore
        .collection('users')
        .doc('fIQfFP1vsVQWsE1sCBe5hYM3h8D2')
        .collection('dietician_eval')
        .get();
    final allfData =
        query5Snapshot.docs.map((doc) => doc.get("Password")).toList();
    setState(() {
      pass = allfData;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await getData();
                },
                icon: const Icon(Icons.refresh_rounded)),
          ],
          leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AdminPage()));
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
          elevation: 0,
          title: const Text(
            "Confirmation Page",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        ),
        body: (Name.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: Name.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 380,
                    margin: const EdgeInsets.all(10),
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              'Name : ${Name[index]} ',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'sharetech',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              'Email : ${email[index]} ',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'sharetech',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              'Practioner Id : ${pracid[index]} ',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'sharetech',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              'Educational Qualification : ${edu[index]} ',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'sharetech',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 30),
                            Text(
                              'Location : ${loc[index]} ',
                              style: const TextStyle(
                                fontSize: 25,
                                fontFamily: 'sharetech',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 200,
                          height: 60,
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 58, 62, 89),
                            child: MaterialButton(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 15, 20, 15),
                                minWidth: 300,
                                onPressed: () async {
                                  postDetailsToFirestore() async {
                                    //call firestore
                                    //call userModel
                                    //send values to firestore

                                    FirebaseFirestore firebaseFirestore =
                                        FirebaseFirestore.instance;
                                    User? user = _auth.currentUser;

                                    DieticianModel userModel = DieticianModel();

                                    userModel.email = email[index];
                                    userModel.uid = user?.uid;
                                    userModel.name = Name[index];
                                    userModel.location = loc[index];
                                    userModel.practitionerID = pracid[index];
                                    userModel.eduqual = edu[index];

                                    await firebaseFirestore
                                        .collection("dietician")
                                        .doc(user?.uid)
                                        .set(userModel.toMap(),
                                            SetOptions(merge: true));

                                    Fluttertoast.showToast(
                                        msg: "Account created successfully");
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

                                    Navigator.pushAndRemoveUntil(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()),
                                        (route) => false);
                                  }

                                  void signUp(
                                      String email, String password) async {
                                    await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password)
                                        .then((value) =>
                                            {postDetailsToFirestore()})
                                        .catchError((e) {
                                      Fluttertoast.showToast(msg: e!.message);
                                    });
                                  }

                                  signUp(email[index], pass[index]);
                                },
                                child: const Text(
                                  "Approve",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "Sharetech"),
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                }));
  }
}

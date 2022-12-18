// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/screens/admin.dart';
import 'package:dietrecallapp/screens/diertecian.dart';
import 'package:dietrecallapp/screens/dietician_page.dart';
import 'package:dietrecallapp/screens/prefrence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../providers/google_sign_in.dart';
import 'homepage.dart';
import 'loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user = FirebaseAuth.instance.currentUser;
  //_formKey
  final _formKey = GlobalKey<FormState>();
  // auth instance

  final _auth = FirebaseAuth.instance;
  // email field
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final emailField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        _email.text = value!;
      },
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
        hintText: t?.email,
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

    //password field
    final passwordField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: _password,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          _password.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusColor: Colors.black,
          hoverColor: Colors.black,
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: t?.password,
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
              width: 20,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    // google sign in
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () {
            emailAndPassSignIn(_email.text, _password.text);
          },
          child: Text(
            "${t?.login}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "Sharetech"),
          )),
    );
    final googleLoginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 350,
        onPressed: () async {
          setState(() => loading = true);
          final googleProvider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          await googleProvider.googleLogin();
          await Hive.openBox('water');
          // ignore: invalid_use_of_protected_member
          if (googleProvider.hasListeners) {
            setState(() => loading = false);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Preference()));
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 10),
            const FaIcon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
            const SizedBox(width: 15),
            Text(
              "${t?.signinwithgoogle}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
    return loading
        ? const Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 168, 184, 139),
              body: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 150),
                          Text(
                            "${t?.signin}",
                            style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Arial",
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(width: 350, child: emailField),
                          const SizedBox(height: 20),
                          SizedBox(
                            child: passwordField,
                            width: 350,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            child: loginButton,
                            width: 120,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${t?.or}",
                            style: const TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 300,
                            child: googleLoginButton,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${t?.newto}",
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Dietician()));
                                },
                                child: Text(
                                  "${t?.signup}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          );
  }

  final _fireStore = FirebaseFirestore.instance;
  List<dynamic> email1 = <dynamic>[];
  Future<void> getData() async {
    //kapha --- food store ---
    QuerySnapshot querySnapshot =
        await _fireStore.collection('dietician').get();
    final allaData =
        querySnapshot.docs.map((doc) => doc.get("${user?.uid}")).toList();
    setState(() {
      email1 = allaData;
    });
  }

  Future<void> emailAndPassSignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);

      if (_email.text == 'admin@gmail.com' && _password.text == 'admin123') {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AdminPage()));
      }
      if (email1.contains(_email.text)) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const DieticianPage()));
      }
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) async => {
                Fluttertoast.showToast(
                  msg: "Login Successful",
                  backgroundColor: const Color.fromARGB(255, 66, 66, 67),
                ),
                await Hive.openBox("recall"),
                await Hive.openBox("morningSnack"),
                await Hive.openBox("lunch"),
                await Hive.openBox("evening"),
                await Hive.openBox("dinner"),
                await Hive.openBox("vatpit"),
                await Hive.openBox("bodytype"),
                await Hive.openBox("vatafood"),
                await Hive.openBox("water"),
                await Hive.openBox("point"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Preference()))
              })
          .catchError((e) {
        setState(() => loading = false);
        Fluttertoast.showToast(
          msg: e!.message,
          backgroundColor: const Color.fromARGB(255, 66, 66, 67),
        );
      });
    }
  }
}

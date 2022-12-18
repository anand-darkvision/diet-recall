import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import '../providers/user_model.dart';
import 'homepage.dart';
import 'loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    final firstNameField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: _firstName,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Name(Min. 3 Character)");
          }
          return null;
        },
        keyboardType: TextInputType.name,
        onSaved: (value) {
          _firstName.text = value!;
        },
        textInputAction: TextInputAction.next,
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
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${t?.firstname}",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ));

    final lastNameField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: _lastName,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Last Name cannot be empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Name(Min. 3 Character)");
          }
          return null;
        },
        keyboardType: TextInputType.name,
        onSaved: (value) {
          _lastName.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${t?.lastname}",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ));

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
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          _email.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${t?.email}",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 10,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ));
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
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.0,
              style: BorderStyle.solid,
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "${t?.password}",
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w900,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ));
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromARGB(255, 58, 62, 89),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: 300,
          onPressed: () {
            signUp(_email.text, _password.text);
          },
          child: Text(
            "${t?.signup}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return loading
        ? const Loading()
        : SafeArea(
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 168, 184, 139),
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 100),
                        Text(
                          "${t?.regis}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(width: 350, child: firstNameField),
                        const SizedBox(height: 25),
                        SizedBox(width: 350, child: lastNameField),
                        const SizedBox(height: 25),
                        SizedBox(width: 350, child: emailField),
                        const SizedBox(height: 25),
                        SizedBox(width: 350, child: passwordField),
                        const SizedBox(height: 80),
                        SizedBox(width: 300, child: loginButton),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${t?.alredy}",
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: Text(
                                "${t?.signin}",
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
                ),
              ),
            ),
          );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //call firestore
    //call userModel
    //send values to firestore

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = _firstName.text;
    userModel.secondName = _lastName.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created successfully");
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
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }
}

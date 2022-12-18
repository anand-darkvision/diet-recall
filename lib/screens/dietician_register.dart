import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/providers/dietician_model.dart';
import 'package:dietrecallapp/screens/dietician_eval.dart';
import 'package:dietrecallapp/screens/dietician_page.dart';
import 'package:dietrecallapp/screens/homepage.dart';
import 'package:dietrecallapp/screens/wait.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DieticianRegister extends StatefulWidget {
  const DieticianRegister({Key? key}) : super(key: key);

  @override
  State<DieticianRegister> createState() => _DieticianRegisterState();
}

class _DieticianRegisterState extends State<DieticianRegister> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _qualityName = TextEditingController();
  final TextEditingController _dietician = TextEditingController();
  final TextEditingController _location = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
        hintText: "First Name",
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
      ),
    );

    final dieticianNoField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: _dietician,
        validator: (value) {
          RegExp regex = RegExp(r'^.{10,}$');
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
          _dietician.text = value!;
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
          hintText: "practitioner Id",
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

    final LocationField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: _location,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          _location.text = value!;
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
          hintText: "Location",
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

    final qualityField = TextFormField(
        cursorColor: Colors.black,
        autofocus: false,
        controller: _qualityName,
        keyboardType: TextInputType.name,
        onSaved: (value) {
          _qualityName.text = value!;
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
          hintText: "Education Qualification",
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
          hintText: "Email",
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
          hintText: "Password",
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
          onPressed: () async {
            // signUp(_email.text, _password.text);
            await postDetailsToFirestore();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Wating()));

            print("document added");
          },
          child: const Text(
            "Sign up",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Dietician Register",
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(width: 350, child: firstNameField),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(width: 350, child: emailField),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(width: 350, child: passwordField),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(width: 350, child: dieticianNoField),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(width: 350, child: qualityField),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    SizedBox(width: 350, child: LocationField),
                  ],
                ),
                const SizedBox(height: 80),
                Row(
                  children: [
                    const SizedBox(width: 85),
                    SizedBox(width: 200, child: loginButton),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void signUp(String email, String password) async {
  //   await _auth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) => {postDetailsToFirestore()})
  //       .catchError((e) {
  //     Fluttertoast.showToast(msg: e!.message);
  //   });
  // }

  postDetailsToFirestore() async {
    //call firestore
    //call userModel
    //send values to firestore

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    DieticianModel userModel = DieticianModel();

    userModel.email = _email.text;
    userModel.name = _firstName.text;
    userModel.location = _location.text;
    userModel.practitionerID = _dietician.text;
    userModel.eduqual = _qualityName.text;
    userModel.pass = _password.text;

    await firebaseFirestore
        .collection("users")
        .doc("fIQfFP1vsVQWsE1sCBe5hYM3h8D2")
        .collection("dietician_eval")
        .doc(user?.uid)
        .set(userModel.toMap(), SetOptions(merge: true));

    Fluttertoast.showToast(msg: "messeage sended to admin successfully");
  }
}

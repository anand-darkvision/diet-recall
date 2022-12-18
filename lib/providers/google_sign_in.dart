import 'package:dietrecallapp/screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    _user = googleUser;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    Fluttertoast.showToast(
      msg: "Google SignIn Successful",
      backgroundColor: const Color.fromARGB(255, 66, 66, 67),
    );
    await Hive.openBox("recall");
    await Hive.openBox("morningSnack");
    await Hive.openBox("lunch");
    await Hive.openBox("evening");
    await Hive.openBox("dinner");
    await Hive.openBox("warning");
    await Hive.openBox("bodytype");
    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  Future<void> logOut(BuildContext context) async {
    try {
      //await googleSignIn.disconnect();
      await googleSignIn.signOut();
      _auth.signOut();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false);
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: const Color.fromARGB(255, 66, 66, 67),
      );
    }
  }
}

// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/screens/FriRan.dart';
import 'package:dietrecallapp/screens/SatRan.dart';
import 'package:dietrecallapp/screens/SunRan.dart';
import 'package:dietrecallapp/screens/ThurRan.dart';
import 'package:dietrecallapp/screens/TueRan.dart';
import 'package:dietrecallapp/screens/WedRan.dart';
import 'package:dietrecallapp/screens/plan_2.dart';
import 'package:dietrecallapp/screens/MonRan.dart';
import 'package:dietrecallapp/usermodel/bodytype.dart';
import 'package:dietrecallapp/usermodel/breakfast_user_model.dart';
import 'package:dietrecallapp/usermodel/dinner_user_model.dart';
import 'package:dietrecallapp/usermodel/evening_user_model.dart';
import 'package:dietrecallapp/usermodel/lunch_user_model.dart';
import 'package:dietrecallapp/usermodel/moringsnack_user_model.dart';
import 'package:dietrecallapp/usermodel/rewardpoint.dart';
import 'package:dietrecallapp/usermodel/vatafood.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DietChart extends StatefulWidget {
  const DietChart({Key? key}) : super(key: key);

  @override
  State<DietChart> createState() => _DietChartState();
}

class _DietChartState extends State<DietChart> {
  double rewardPoint = 0;
  //kapha var
  List<dynamic> kaphaBreakfastSnacks = <dynamic>[];
  List<dynamic> kaphaBreakfast = <dynamic>[];
  List<dynamic> kaphaSideDish = <dynamic>[];
  List<dynamic> kaphaLunch = <dynamic>[];
  List<dynamic> kaphaEveningSnacks = <dynamic>[];
  List<dynamic> kaphaDinner = <dynamic>[];

  //pitta var
  List<dynamic> PittaBreakfastSnacks = <dynamic>[];
  List<dynamic> PittaBreakfast = <dynamic>[];
  List<dynamic> PittaSideDish = <dynamic>[];
  List<dynamic> PittaLunch = <dynamic>[];
  List<dynamic> PittaEveningSnacks = <dynamic>[];
  List<dynamic> PittaDinner = <dynamic>[];

  //vata var
  List<dynamic> VataBreakfastSnacks = <dynamic>[];
  List<dynamic> VataBreakfast = <dynamic>[];
  List<dynamic> VataSideDish = <dynamic>[];
  List<dynamic> VataLunch = <dynamic>[];
  List<dynamic> VataEveningSnacks = <dynamic>[];
  List<dynamic> VataDinner = <dynamic>[];

  // vata pitta var
  List<dynamic> VataPittaBreakfastSnacks = <dynamic>[];
  List<dynamic> VataPittaBreakfast = <dynamic>[];
  List<dynamic> VataPittaSideDish = <dynamic>[];
  List<dynamic> VataPittaLunch = <dynamic>[];
  List<dynamic> VataPittaEveningSnacks = <dynamic>[];
  List<dynamic> VataPittaDinner = <dynamic>[];

  // vata kapha var
  List<dynamic> VataKaphaBreakfastSnacks = <dynamic>[];
  List<dynamic> VataKaphaBreakfast = <dynamic>[];
  List<dynamic> VataKaphaSideDish = <dynamic>[];
  List<dynamic> VataKaphaLunch = <dynamic>[];
  List<dynamic> VataKaphaEveningSnacks = <dynamic>[];
  List<dynamic> VataKaphaDinner = <dynamic>[];

  //pitta kapha var
  List<dynamic> PittaKaphaBreakfastSnacks = <dynamic>[];
  List<dynamic> PittakaphaBreakfast = <dynamic>[];
  List<dynamic> PittakaphaSideDish = <dynamic>[];
  List<dynamic> PittakaphaLunch = <dynamic>[];
  List<dynamic> PittakaphaSnacks = <dynamic>[];
  List<dynamic> PittakaphaDinner = <dynamic>[];

  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser!;
  late Box box8;
  late Box contactsBox;

  void addpoint(rewardpoint contact) {
    final contactBox = Hive.box('point');
    contactBox.add(contact);
  }

  //box open
  void createbox() async {
    box8 = await Hive.openBox('vatafood');
    contactsBox = await Hive.openBox('bodytype');
  }

  @override
  void initState() {
    Hive.openBox('point');
    createbox();
    super.initState();
  }

  final contactBox = Hive.box("vatafood");
  void addfood(VataFoodcContact contact) {
    contactBox.add(contact);
  }

  var r = Random(DateTime.now().hour);

  final contact5Box = Hive.box('dinner');
  final contactBox1 = Hive.box("recall");
  final contactBox2 = Hive.box("morningSnack");
  final contactBox3 = Hive.box("lunch");
  final contactBox4 = Hive.box("evening");

  final _fireStore = FirebaseFirestore.instance;
  Future<void> getData() async {
    //kapha --- food store ---
    QuerySnapshot querySnapshot =
        await _fireStore.collection('KaphaFood').get();
    final allaData =
        querySnapshot.docs.map((doc) => doc.get('BreakFast Snacks')).toList();
    kaphaBreakfastSnacks = allaData[0];
    final allbData =
        querySnapshot.docs.map((doc) => doc.get('BreakFast')).toList();
    kaphaBreakfast = allbData[0];
    final allcData =
        querySnapshot.docs.map((doc) => doc.get('Dinner')).toList();
    kaphaDinner = allcData[0];
    final alldData =
        querySnapshot.docs.map((doc) => doc.get('SideDish')).toList();
    kaphaSideDish = alldData[0];
    final alleData =
        querySnapshot.docs.map((doc) => doc.get('Evening Snacks')).toList();
    kaphaEveningSnacks = alleData[0];
    final allfData = querySnapshot.docs.map((doc) => doc.get('Lunch')).toList();
    kaphaLunch = allfData;

    //vata --- food store ---
    QuerySnapshot queryaSnapshot =
        await _fireStore.collection('VataFood').get();
    final allgData =
        queryaSnapshot.docs.map((doc) => doc.get('BreakFast Snacks')).toList();
    VataBreakfastSnacks = allgData[0];
    final allhData =
        queryaSnapshot.docs.map((doc) => doc.get('BreakFast')).toList();
    VataBreakfast = allhData[0];
    final alliData =
        queryaSnapshot.docs.map((doc) => doc.get('Dinner')).toList();
    VataDinner = alliData[0];
    final alljData =
        queryaSnapshot.docs.map((doc) => doc.get('SideDish')).toList();
    VataSideDish = alljData[0];
    final allkData =
        queryaSnapshot.docs.map((doc) => doc.get('Evening Snacks')).toList();
    VataEveningSnacks = allkData[0];
    final alllData =
        queryaSnapshot.docs.map((doc) => doc.get('Lunch')).toList();
    VataLunch = alllData[0];

    //vata --- food store ---
    QuerySnapshot querybSnapshot =
        await _fireStore.collection('PittaFood').get();
    final allmData =
        querybSnapshot.docs.map((doc) => doc.get('BreakFast Snacks')).toList();
    PittaBreakfastSnacks = allmData[0];
    final allnData =
        querybSnapshot.docs.map((doc) => doc.get('BreakFast')).toList();
    PittaBreakfast = allnData[0];
    final alloData =
        querybSnapshot.docs.map((doc) => doc.get('Dinner')).toList();
    PittaDinner = alloData[0];
    final allpData =
        querybSnapshot.docs.map((doc) => doc.get('Side Dish')).toList();
    PittaSideDish = allpData[0];
    final allqData =
        querybSnapshot.docs.map((doc) => doc.get('Evening Snacks')).toList();
    PittaEveningSnacks = allqData[0];
    final allrData =
        querybSnapshot.docs.map((doc) => doc.get('Lunch')).toList();
    PittaLunch = allrData[0];

    // vata pitta food ----- store -----

    QuerySnapshot querycSnapshot =
        await _fireStore.collection('VataPittaFood').get();
    final allsData =
        querycSnapshot.docs.map((doc) => doc.get('BreakFast Snacks')).toList();
    VataPittaBreakfastSnacks = allsData[0];
    final alltData =
        querycSnapshot.docs.map((doc) => doc.get('BreakFast')).toList();
    VataPittaBreakfast = alltData[0];
    final alluData =
        querycSnapshot.docs.map((doc) => doc.get('Dinner')).toList();
    VataPittaDinner = alluData[0];
    final allvData =
        querycSnapshot.docs.map((doc) => doc.get('SideDish')).toList();
    VataPittaSideDish = allvData[0];
    final allwData =
        querycSnapshot.docs.map((doc) => doc.get('Evening Snacks')).toList();
    VataPittaEveningSnacks = allwData[0];
    final allxData =
        querycSnapshot.docs.map((doc) => doc.get('Lunch')).toList();
    VataPittaLunch = allxData[0];

    // vata kapha food -------store-----
    QuerySnapshot querydSnapshot =
        await _fireStore.collection('VataKaphaFood').get();
    final allyData =
        querycSnapshot.docs.map((doc) => doc.get('BreakFast Snacks')).toList();
    VataKaphaBreakfastSnacks = allyData[0];
    final allzData =
        querycSnapshot.docs.map((doc) => doc.get('BreakFast')).toList();
    VataKaphaBreakfast = allzData[0];
    final allaaData =
        querycSnapshot.docs.map((doc) => doc.get('Dinner')).toList();
    VataKaphaDinner = allaaData[0];
    final allbbData =
        querycSnapshot.docs.map((doc) => doc.get('SideDish')).toList();
    VataKaphaSideDish = allbbData[0];
    final allccData =
        querycSnapshot.docs.map((doc) => doc.get('Evening Snacks')).toList();
    VataKaphaEveningSnacks = allccData[0];
    final allddData =
        querycSnapshot.docs.map((doc) => doc.get('Lunch')).toList();
    VataKaphaLunch = allddData[0];

    //pitta kapha food -----store-----
    QuerySnapshot queryeSnapshot =
        await _fireStore.collection('PittaKaphaFood').get();
    final alleeData =
        querycSnapshot.docs.map((doc) => doc.get('BreakFast Snacks')).toList();
    PittaKaphaBreakfastSnacks = alleeData[0];
    final allffData =
        querycSnapshot.docs.map((doc) => doc.get('BreakFast')).toList();
    PittakaphaBreakfast = allffData[0];
    final allggData =
        querycSnapshot.docs.map((doc) => doc.get('Dinner')).toList();
    PittakaphaDinner = allggData[0];
    final allhhData =
        querycSnapshot.docs.map((doc) => doc.get('SideDish')).toList();
    PittakaphaSideDish = allhhData[0];
    final alliiData =
        querycSnapshot.docs.map((doc) => doc.get('Evening Snacks')).toList();
    PittakaphaSnacks = alliiData[0];
    final alljjData =
        querycSnapshot.docs.map((doc) => doc.get('Lunch')).toList();
    PittakaphaLunch = alljjData[0];
  }

  Widget buildCardField(String use, String day) {
    // kapha
    int kbs = kaphaBreakfastSnacks.length;
    int kb = kaphaBreakfast.length;
    int kl = kaphaLunch.length;
    int ksd = kaphaSideDish.length;
    int kes = kaphaEveningSnacks.length;
    int kd = kaphaDinner.length;
    // vata
    int vbs = VataBreakfastSnacks.length;
    int vb = VataBreakfast.length;
    int vl = VataLunch.length;
    int vsd = VataSideDish.length;
    int ves = VataEveningSnacks.length;
    int vd = VataDinner.length;

    //pitta
    int pbs = PittaBreakfastSnacks.length;
    int pb = PittaBreakfast.length;
    int pl = PittaLunch.length;
    int psd = PittaSideDish.length;
    int pes = PittaEveningSnacks.length;
    int pd = PittaDinner.length;

    // vata pitta

    int vpbs = VataPittaBreakfastSnacks.length;
    int vpb = VataPittaBreakfast.length;
    int vpl = VataPittaLunch.length;
    int vpsd = VataPittaSideDish.length;
    int vpes = VataPittaEveningSnacks.length;
    int vpd = VataPittaDinner.length;

    // vata kapha

    int vkbs = VataKaphaBreakfastSnacks.length;
    int vkb = VataKaphaBreakfast.length;
    int vkl = VataKaphaLunch.length;
    int vksd = VataKaphaSideDish.length;
    int vkes = VataKaphaEveningSnacks.length;
    int vkd = VataKaphaDinner.length;

    // pitta kapha

    int pkbs = PittaKaphaBreakfastSnacks.length;
    int pkb = PittakaphaBreakfast.length;
    int pkl = PittakaphaLunch.length;
    int pksd = PittakaphaSideDish.length;
    int pkes = PittakaphaSnacks.length;
    int pkd = PittakaphaDinner.length;

    var mvatams, mvatab, mvatal, mvatasd, mvataes, mvatad;
    if (use == 'vata') {
      if (day == 'monday') {
        mvatams = MonRan().monday(vbs);
        mvatab = MonRan().monday(vb);
        mvatal = MonRan().monday(vl);
        mvatasd = MonRan().monday(vsd);
        mvataes = MonRan().monday(ves);
        mvatad = MonRan().monday(vd);
        print(
            "monday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad,${MonRan().monday(vbs)}");
      } else if (day == 'tuesday') {
        mvatams = TueRan().tuesday(vbs);
        mvatab = TueRan().tuesday(vb);
        mvatal = TueRan().tuesday(vl);
        mvatasd = TueRan().tuesday(vsd);
        mvataes = TueRan().tuesday(ves);
        mvatad = TueRan().tuesday(vd);
        print("tuesday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'wednesday') {
        mvatams = WedRan().wednesday(vbs);
        mvatab = WedRan().wednesday(vb);
        mvatal = WedRan().wednesday(vl);
        mvatasd = WedRan().wednesday(vsd);
        mvataes = WedRan().wednesday(ves);
        mvatad = WedRan().wednesday(vd);
        print("wednesday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'thursday') {
        mvatams = ThurRan().thursday(vbs);
        mvatab = ThurRan().thursday(vb);
        mvatal = ThurRan().thursday(vl);
        mvatasd = ThurRan().thursday(vsd);
        mvataes = ThurRan().thursday(ves);
        mvatad = ThurRan().thursday(vd);
        print("thursday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'friday') {
        mvatams = FriRan().friday(vbs);
        mvatab = FriRan().friday(vb);
        mvatal = FriRan().friday(vl);
        mvatasd = FriRan().friday(vsd);
        mvataes = FriRan().friday(ves);
        mvatad = FriRan().friday(vd);
        print("friday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'saturday') {
        mvatams = SatRan().saturday(vbs);
        mvatab = SatRan().saturday(vb);
        mvatal = SatRan().saturday(vl);
        mvatasd = SatRan().saturday(vsd);
        mvataes = SatRan().saturday(ves);
        mvatad = SatRan().saturday(vd);
        print("saturday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else {
        mvatams = SunRan().sunday(vbs);
        mvatab = SunRan().sunday(vb);
        mvatal = SunRan().sunday(vl);
        mvatasd = SunRan().sunday(vsd);
        mvataes = SunRan().sunday(ves);
        mvatad = SunRan().sunday(vd);
        print("sunday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      }

      // morning snacks
      var num2 = contactBox2.length;
      for (int i = 0; i <= num2 - 1; i++) {
        final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

        Morning_snack_food() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackFood ==
                VataBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        Morning_snack_juice() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackDrinks ==
                VataBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            Morning_snack_food();
            Morning_snack_juice();
          }
        }

        RewardPointCalculator();
      }
      // breakfst
      var num = contactBox1.length;
      for (int i = 0; i <= num - 1; i++) {
        final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

        breakfastfood() {
          for (int j = 1; j <= 13; j++) {
            if (contact_break.breakFastFood == VataBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        breakfastjuice() {
          for (int j = 1; j <= 22; j++) {
            if (contact_break.breakFastDrinks == VataBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            breakfastfood();
            breakfastjuice();
          }
        }

        RewardPointCalculator();
      }

      // lunch
      var num3 = contactBox3.length;
      for (int i = 0; i <= num3 - 1; i++) {
        final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

        lunchfood() {
          for (int j = 1; j <= 15; j++) {
            if (new1_contact_break.lunchFood == VataLunch[mvatal]) {
              rewardPoint += 16.665;
            }
          }
        }

        lunchjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new1_contact_break.lunchDrinks == VataLunch[mvatal]) {
              rewardPoint += 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            lunchfood();
            lunchjuice();
          }
        }

        RewardPointCalculator();
      }

      // evening snacks

      var num4 = contactBox4.length;
      for (int i = 0; i <= num4 - 1; i++) {
        final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

        eveningfood() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningFood == VataEveningSnacks[mvataes]) {
              setState(() {
                rewardPoint += 16.665;
              });
            }
          }
        }

        eveningjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningDrinks ==
                VataEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            eveningfood();
            eveningjuice();
          }
        }

        RewardPointCalculator();
      }

      //dinner

      var num5 = contactBox.length;
      for (int i = 0; i <= num5 - 1; i++) {
        final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

        dinnerfood() {
          for (int j = 1; j <= 11; j++) {
            if (new3_contact_break.dinnerFood == VataDinner[mvatad][j]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        dinnerjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new3_contact_break.dinnerDrinks == VataDinner[mvatad]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            dinnerfood();
            dinnerjuice();
          }
        }

        RewardPointCalculator();
      }

      Hive.openBox('point');
      Box box = Hive.box('point');
      if (box.isEmpty) {
        final fg = rewardpoint(rewardPoint);

        print("point Addded on empty");
        addpoint(fg);
      } else {
        final contact_break = box.getAt(0) as rewardpoint;
        var th = contact_break.point;
        var nr = th + rewardPoint;

        final fg = rewardpoint(nr);
        addpoint(fg);
        box.deleteAt(0);
        print("point added successfully");
      }
      var t = AppLocalizations.of(context);
      return SizedBox(
        height: 400,
        width: 340,
        child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "${t?.toddiet}",
                    style: const TextStyle(
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${t?.mornsnacks}:",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataBreakfastSnacks[mvatams]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${t?.breakfast}:",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataBreakfast[mvatab]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${t?.lunch}:",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataLunch[mvatal]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${t?.sided}:",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataSideDish[mvatasd]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${t?.evenin}:",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataEveningSnacks[mvataes]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "${t?.dinne}:",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataDinner[mvatad]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (use == 'pitta') {
      if (day == 'monday') {
        mvatams = MonRan().monday(pbs);
        mvatab = MonRan().monday(pb);
        mvatal = MonRan().monday(pl);
        mvatasd = MonRan().monday(psd);
        mvataes = MonRan().monday(pes);
        mvatad = MonRan().monday(pd);
        print(
            "monday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad,${MonRan().monday(vbs)}");
      } else if (day == 'tuesday') {
        mvatams = TueRan().tuesday(pbs);
        mvatab = TueRan().tuesday(pb);
        mvatal = TueRan().tuesday(pl);
        mvatasd = TueRan().tuesday(psd);
        mvataes = TueRan().tuesday(pes);
        mvatad = TueRan().tuesday(pd);
        print("tuesday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'wednesday') {
        mvatams = WedRan().wednesday(pbs);
        mvatab = WedRan().wednesday(pb);
        mvatal = WedRan().wednesday(pl);
        mvatasd = WedRan().wednesday(psd);
        mvataes = WedRan().wednesday(pes);
        mvatad = WedRan().wednesday(pd);
        print("wednesday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'thursday') {
        mvatams = ThurRan().thursday(pbs);
        mvatab = ThurRan().thursday(pb);
        mvatal = ThurRan().thursday(pl);
        mvatasd = ThurRan().thursday(psd);
        mvataes = ThurRan().thursday(pes);
        mvatad = ThurRan().thursday(pd);
        print("thursday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'friday') {
        mvatams = FriRan().friday(pbs);
        mvatab = FriRan().friday(pb);
        mvatal = FriRan().friday(pl);
        mvatasd = FriRan().friday(psd);
        mvataes = FriRan().friday(pes);
        mvatad = FriRan().friday(pd);
        print("Friday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else if (day == 'saturday') {
        mvatams = SatRan().saturday(pbs);
        mvatab = SatRan().saturday(pb);
        mvatal = SatRan().saturday(pl);
        mvatasd = SatRan().saturday(psd);
        mvataes = SatRan().saturday(pes);
        mvatad = SatRan().saturday(pd);
        print("Saturday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      } else {
        mvatams = SunRan().sunday(pbs);
        mvatab = SunRan().sunday(pb);
        mvatal = SunRan().sunday(pl);
        mvatasd = SunRan().sunday(psd);
        mvataes = SunRan().sunday(pes);
        mvatad = SunRan().sunday(pd);
        print("sunday:$mvatams,$mvatab,$mvatal,$mvatasd,$mvataes,$mvatad");
      }

      // morning snacks
      var num2 = contactBox2.length;
      for (int i = 0; i <= num2 - 1; i++) {
        final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

        Morning_snack_food() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackFood ==
                PittaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        Morning_snack_juice() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackDrinks ==
                PittaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            Morning_snack_food();
            Morning_snack_juice();
          }
        }

        RewardPointCalculator();
      }
      // breakfst
      var num = contactBox1.length;
      for (int i = 0; i <= num - 1; i++) {
        final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

        breakfastfood() {
          for (int j = 1; j <= 13; j++) {
            if (contact_break.breakFastFood == PittaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        breakfastjuice() {
          for (int j = 1; j <= 22; j++) {
            if (contact_break.breakFastDrinks == PittaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            breakfastfood();
            breakfastjuice();
          }
        }

        RewardPointCalculator();
      }

      // lunch
      var num3 = contactBox3.length;
      for (int i = 0; i <= num3 - 1; i++) {
        final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

        lunchfood() {
          for (int j = 1; j <= 15; j++) {
            if (new1_contact_break.lunchFood == PittaLunch[mvatal]) {
              rewardPoint += 16.665;
            }
          }
        }

        lunchjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new1_contact_break.lunchDrinks == PittaLunch[mvatal]) {
              rewardPoint += 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            lunchfood();
            lunchjuice();
          }
        }

        RewardPointCalculator();
      }

      // evening snacks

      var num4 = contactBox4.length;
      for (int i = 0; i <= num4 - 1; i++) {
        final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

        eveningfood() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningFood == PittaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            }
          }
        }

        eveningjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningDrinks ==
                PittaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            eveningfood();
            eveningjuice();
          }
        }

        RewardPointCalculator();
      }

      //dinner

      var num5 = contactBox.length;
      for (int i = 0; i <= num5 - 1; i++) {
        final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

        dinnerfood() {
          for (int j = 1; j <= 11; j++) {
            if (new3_contact_break.dinnerFood == PittaDinner[mvatad][j]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        dinnerjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new3_contact_break.dinnerDrinks == PittaDinner[mvatad]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            dinnerfood();
            dinnerjuice();
          }
        }

        RewardPointCalculator();
      }

      Hive.openBox('point');
      Box box = Hive.box('point');
      if (box.isEmpty) {
        final fg = rewardpoint(rewardPoint);

        print("point Addded on empty");
        addpoint(fg);
      } else {
        final contact_break = box.getAt(0) as rewardpoint;
        var th = contact_break.point;
        var nr = th + rewardPoint;

        final fg = rewardpoint(nr);
        addpoint(fg);
        box.deleteAt(0);
        print("point added successfully");
      }
      var t = AppLocalizations.of(context);
      return SizedBox(
        height: 400,
        width: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: SingleChildScrollView(
                  child: Text(
                    "${t?.toddiet}",
                    style: const TextStyle(
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaBreakfastSnacks[0]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "BreakFast :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaBreakfast[mvatab]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Lunch :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaLunch[mvatal]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "SideDish :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaSideDish[mvatasd]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaEveningSnacks[mvataes]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Dinner :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaDinner[mvatad]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (use == 'kapha') {
      if (day == 'monday') {
        mvatams = MonRan().monday(kbs);
        mvatab = MonRan().monday(kb);
        mvatal = MonRan().monday(kl);
        mvatasd = MonRan().monday(ksd);
        mvataes = MonRan().monday(kes);
        mvatad = MonRan().monday(kd);
      } else if (day == 'tuesday') {
        mvatams = TueRan().tuesday(kbs);
        mvatab = TueRan().tuesday(kb);
        mvatal = TueRan().tuesday(kl);
        mvatasd = TueRan().tuesday(ksd);
        mvataes = TueRan().tuesday(kes);
        mvatad = TueRan().tuesday(kd);
      } else if (day == 'wednesday') {
        mvatams = WedRan().wednesday(kbs);
        mvatab = WedRan().wednesday(kb);
        mvatal = WedRan().wednesday(kl);
        mvatasd = WedRan().wednesday(ksd);
        mvataes = WedRan().wednesday(kes);
        mvatad = WedRan().wednesday(kd);
      } else if (day == 'thursday') {
        mvatams = ThurRan().thursday(kbs);
        mvatab = ThurRan().thursday(kb);
        mvatal = ThurRan().thursday(kl);
        mvatasd = ThurRan().thursday(ksd);
        mvataes = ThurRan().thursday(kes);
        mvatad = ThurRan().thursday(kd);
      } else if (day == 'friday') {
        mvatams = FriRan().friday(kbs);
        mvatab = FriRan().friday(kb);
        mvatal = FriRan().friday(kl);
        mvatasd = FriRan().friday(ksd);
        mvataes = FriRan().friday(kes);
        mvatad = FriRan().friday(kd);
      } else if (day == 'saturday') {
        mvatams = SatRan().saturday(kbs);
        mvatab = SatRan().saturday(kb);
        mvatal = SatRan().saturday(kl);
        mvatasd = SatRan().saturday(ksd);
        mvataes = SatRan().saturday(kes);
        mvatad = SatRan().saturday(kd);
      } else {
        mvatams = SunRan().sunday(kbs);
        mvatab = SunRan().sunday(kb);
        mvatal = SunRan().sunday(kl);
        mvatasd = SunRan().sunday(ksd);
        mvataes = SunRan().sunday(kes);
        mvatad = SunRan().sunday(kd);
      }
      // morning snacks
      var num2 = contactBox2.length;
      for (int i = 0; i <= num2 - 1; i++) {
        final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

        Morning_snack_food() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackFood ==
                kaphaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        Morning_snack_juice() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackDrinks ==
                kaphaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            Morning_snack_food();
            Morning_snack_juice();
          }
        }

        RewardPointCalculator();
      }
      // breakfst
      var num = contactBox1.length;
      for (int i = 0; i <= num - 1; i++) {
        final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

        breakfastfood() {
          for (int j = 1; j <= 13; j++) {
            if (contact_break.breakFastFood == kaphaBreakfast[mvatab]) {
              setState(() {
                rewardPoint += 16.665;
              });
            } else {
              setState(() {
                rewardPoint -= 16.665;
              });
            }
          }
        }

        breakfastjuice() {
          for (int j = 1; j <= 22; j++) {
            if (contact_break.breakFastDrinks == kaphaBreakfast[mvatab]) {
              setState(() {
                rewardPoint += 16.665;
              });
            } else {
              setState(() {
                rewardPoint -= 16.665;
              });
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            breakfastfood();
            breakfastjuice();
          }
        }

        RewardPointCalculator();
      }

      // lunch
      var num3 = contactBox3.length;
      for (int i = 0; i <= num3 - 1; i++) {
        final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

        lunchfood() {
          for (int j = 1; j <= 15; j++) {
            if (new1_contact_break.lunchFood == kaphaLunch[mvatal]) {
              setState(() {
                rewardPoint += 16.665;
              });
            }
          }
        }

        lunchjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new1_contact_break.lunchDrinks == kaphaLunch[mvatal]) {
              rewardPoint += 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            lunchfood();
            lunchjuice();
          }
        }

        RewardPointCalculator();
      }

      // evening snacks

      var num4 = contactBox4.length;
      for (int i = 0; i <= num4 - 1; i++) {
        final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

        eveningfood() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningFood == kaphaEveningSnacks[mvataes]) {
              setState(() {
                rewardPoint += 16.665;
              });
            }
          }
        }

        eveningjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningDrinks ==
                kaphaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            eveningfood();
            eveningjuice();
          }
        }

        RewardPointCalculator();
      }

      //dinner

      var num5 = contactBox.length;
      for (int i = 0; i <= num5 - 1; i++) {
        final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

        dinnerfood() {
          for (int j = 1; j <= 11; j++) {
            if (new3_contact_break.dinnerFood == kaphaDinner[mvatad][j]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        dinnerjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new3_contact_break.dinnerDrinks == kaphaDinner[mvatad]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            dinnerfood();
            dinnerjuice();
          }
        }

        RewardPointCalculator();
      }

      Hive.openBox('point');
      Box box = Hive.box('point');
      if (box.isEmpty) {
        final fg = rewardpoint(rewardPoint);

        print("point Addded on empty");
        addpoint(fg);
      } else {
        final contact_break = box.getAt(0) as rewardpoint;
        var th = contact_break.point;
        var nr = th + rewardPoint;

        final fg = rewardpoint(nr);
        addpoint(fg);
        box.deleteAt(0);
        print("point added successfully");
      }
      var t = AppLocalizations.of(context);
      return SizedBox(
        height: 400,
        width: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "Todays Diet",
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Morning Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${kaphaBreakfastSnacks[mvatams]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "BreakFast :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${kaphaBreakfast[mvatab]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Lunch :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${kaphaLunch[mvatal]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "SideDish :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${kaphaSideDish[mvatasd]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${kaphaEveningSnacks[mvataes]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Dinner :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${kaphaDinner[mvatad]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (use == 'vata And pitta') {
      if (day == 'monday') {
        mvatams = MonRan().monday(vpbs);
        mvatab = MonRan().monday(vpb);
        mvatal = MonRan().monday(vpl);
        mvatasd = MonRan().monday(vpsd);
        mvataes = MonRan().monday(vpes);
        mvatad = MonRan().monday(vpd);
      } else if (day == 'tuesday') {
        mvatams = TueRan().tuesday(vpbs);
        mvatab = TueRan().tuesday(vpb);
        mvatal = TueRan().tuesday(vpl);
        mvatasd = TueRan().tuesday(vpsd);
        mvataes = TueRan().tuesday(vpes);
        mvatad = TueRan().tuesday(vpd);
      } else if (day == 'wednesday') {
        mvatams = WedRan().wednesday(vpbs);
        mvatab = WedRan().wednesday(vpb);
        mvatal = WedRan().wednesday(vpl);
        mvatasd = WedRan().wednesday(vpsd);
        mvataes = WedRan().wednesday(vpes);
        mvatad = WedRan().wednesday(vpd);
      } else if (day == 'thursday') {
        mvatams = ThurRan().thursday(vpbs);
        mvatab = ThurRan().thursday(vpb);
        mvatal = ThurRan().thursday(vpl);
        mvatasd = ThurRan().thursday(vpsd);
        mvataes = ThurRan().thursday(vpes);
        mvatad = ThurRan().thursday(vpd);
      } else if (day == 'friday') {
        mvatams = FriRan().friday(vpbs);
        mvatab = FriRan().friday(vpb);
        mvatal = FriRan().friday(vpl);
        mvatasd = FriRan().friday(vpsd);
        mvataes = FriRan().friday(vpes);
        mvatad = FriRan().friday(vpd);
      } else if (day == 'saturday') {
        mvatams = SatRan().saturday(vpbs);
        mvatab = SatRan().saturday(vpb);
        mvatal = SatRan().saturday(vpl);
        mvatasd = SatRan().saturday(vpsd);
        mvataes = SatRan().saturday(vpes);
        mvatad = SatRan().saturday(vpd);
      } else {
        mvatams = SunRan().sunday(vpbs);
        mvatab = SunRan().sunday(vpb);
        mvatal = SunRan().sunday(vpl);
        mvatasd = SunRan().sunday(vpsd);
        mvataes = SunRan().sunday(vpes);
        mvatad = SunRan().sunday(vpd);
      }
      // morning snacks
      var num2 = contactBox2.length;
      for (int i = 0; i <= num2 - 1; i++) {
        final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

        Morning_snack_food() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackFood ==
                VataPittaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        Morning_snack_juice() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackDrinks ==
                VataPittaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            Morning_snack_food();
            Morning_snack_juice();
          }
        }

        RewardPointCalculator();
      }
      // breakfst
      var num = contactBox1.length;
      for (int i = 0; i <= num - 1; i++) {
        final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

        breakfastfood() {
          for (int j = 1; j <= 13; j++) {
            if (contact_break.breakFastFood == VataPittaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        breakfastjuice() {
          for (int j = 1; j <= 22; j++) {
            if (contact_break.breakFastDrinks == VataPittaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            breakfastfood();
            breakfastjuice();
          }
        }

        RewardPointCalculator();
      }

      // lunch
      var num3 = contactBox3.length;
      for (int i = 0; i <= num3 - 1; i++) {
        final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

        lunchfood() {
          for (int j = 1; j <= 15; j++) {
            if (new1_contact_break.lunchFood == VataPittaLunch[mvatal]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        lunchjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new1_contact_break.lunchDrinks == VataPittaLunch[mvatal]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            lunchfood();
            lunchjuice();
          }
        }

        RewardPointCalculator();
      }

      // evening snacks

      var num4 = contactBox4.length;
      for (int i = 0; i <= num4 - 1; i++) {
        final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

        eveningfood() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningFood ==
                VataPittaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        eveningjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningDrinks ==
                VataPittaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            eveningfood();
            eveningjuice();
          }
        }

        RewardPointCalculator();
      }

      //dinner

      var num5 = contactBox.length;
      for (int i = 0; i <= num5 - 1; i++) {
        final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

        dinnerfood() {
          for (int j = 1; j <= 11; j++) {
            if (new3_contact_break.dinnerFood == VataPittaDinner[mvatad][j]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        dinnerjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new3_contact_break.dinnerDrinks == VataPittaDinner[mvatad]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            dinnerfood();
            dinnerjuice();
          }
        }

        RewardPointCalculator();
      }

      Hive.openBox('point');
      Box box = Hive.box('point');
      if (box.isEmpty) {
        final fg = rewardpoint(rewardPoint);

        print("point Addded on empty");
        addpoint(fg);
      } else {
        final contact_break = box.getAt(0) as rewardpoint;
        var th = contact_break.point;
        var nr = th + rewardPoint;

        final fg = rewardpoint(nr);
        addpoint(fg);
        box.deleteAt(0);
        print("point added successfully");
      }
      var t = AppLocalizations.of(context);
      return SizedBox(
        height: 400,
        width: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "Todays Diet",
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Morning Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataPittaBreakfastSnacks[mvatams]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "BreakFast :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataPittaBreakfast[mvatab]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Lunch :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataPittaLunch[mvatal]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "SideDish :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataPittaSideDish[mvatasd]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataPittaEveningSnacks[mvataes]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Dinner :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataPittaDinner[mvatad]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (use == 'vata And kapha') {
      if (day == 'monday') {
        mvatams = MonRan().monday(vkbs);
        mvatab = MonRan().monday(vkb);
        mvatal = MonRan().monday(vkl);
        mvatasd = MonRan().monday(vksd);
        mvataes = MonRan().monday(vkes);
        mvatad = MonRan().monday(vkd);
      } else if (day == 'tuesday') {
        mvatams = TueRan().tuesday(vkbs);
        mvatab = TueRan().tuesday(vkb);
        mvatal = TueRan().tuesday(vkl);
        mvatasd = TueRan().tuesday(vksd);
        mvataes = TueRan().tuesday(vkes);
        mvatad = TueRan().tuesday(vkd);
      } else if (day == 'wednesday') {
        mvatams = WedRan().wednesday(vkbs);
        mvatab = WedRan().wednesday(vkb);
        mvatal = WedRan().wednesday(vkl);
        mvatasd = WedRan().wednesday(vksd);
        mvataes = WedRan().wednesday(vkes);
        mvatad = WedRan().wednesday(vkd);
      } else if (day == 'thursday') {
        mvatams = ThurRan().thursday(vkbs);
        mvatab = ThurRan().thursday(vkb);
        mvatal = ThurRan().thursday(vkl);
        mvatasd = ThurRan().thursday(vksd);
        mvataes = ThurRan().thursday(vkes);
        mvatad = ThurRan().thursday(vkd);
      } else if (day == 'friday') {
        mvatams = FriRan().friday(vkbs);
        mvatab = FriRan().friday(vkb);
        mvatal = FriRan().friday(vkl);
        mvatasd = FriRan().friday(vksd);
        mvataes = FriRan().friday(vkes);
        mvatad = FriRan().friday(vkd);
      } else if (day == 'saturday') {
        mvatams = SatRan().saturday(vkbs);
        mvatab = SatRan().saturday(vkb);
        mvatal = SatRan().saturday(vkl);
        mvatasd = SatRan().saturday(vksd);
        mvataes = SatRan().saturday(vkes);
        mvatad = SatRan().saturday(vkd);
      } else {
        mvatams = SunRan().sunday(vkbs);
        mvatab = SunRan().sunday(vkb);
        mvatal = SunRan().sunday(vkl);
        mvatasd = SunRan().sunday(vksd);
        mvataes = SunRan().sunday(vkes);
        mvatad = SunRan().sunday(vkd);
      }
      var num2 = contactBox2.length;
      for (int i = 0; i <= num2 - 1; i++) {
        final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

        Morning_snack_food() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackFood ==
                VataKaphaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        Morning_snack_juice() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackDrinks ==
                VataKaphaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            Morning_snack_food();
            Morning_snack_juice();
          }
        }

        RewardPointCalculator();
      }
      // breakfst
      var num = contactBox1.length;
      for (int i = 0; i <= num - 1; i++) {
        final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

        breakfastfood() {
          for (int j = 1; j <= 13; j++) {
            if (contact_break.breakFastFood == VataKaphaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        breakfastjuice() {
          for (int j = 1; j <= 22; j++) {
            if (contact_break.breakFastDrinks == VataKaphaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            breakfastfood();
            breakfastjuice();
          }
        }

        RewardPointCalculator();
      }

      // lunch
      var num3 = contactBox3.length;
      for (int i = 0; i <= num3 - 1; i++) {
        final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

        lunchfood() {
          for (int j = 1; j <= 15; j++) {
            if (new1_contact_break.lunchFood == VataKaphaLunch[mvatal]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        lunchjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new1_contact_break.lunchDrinks == VataKaphaLunch[mvatal]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            lunchfood();
            lunchjuice();
          }
        }

        RewardPointCalculator();
      }

      // evening snacks

      var num4 = contactBox4.length;
      for (int i = 0; i <= num4 - 1; i++) {
        final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

        eveningfood() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningFood ==
                VataKaphaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        eveningjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningDrinks ==
                VataKaphaEveningSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            eveningfood();
            eveningjuice();
          }
        }

        RewardPointCalculator();
      }

      //dinner

      var num5 = contactBox.length;
      for (int i = 0; i <= num5 - 1; i++) {
        final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

        dinnerfood() {
          for (int j = 1; j <= 11; j++) {
            if (new3_contact_break.dinnerFood == VataKaphaDinner[mvatad][j]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        dinnerjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new3_contact_break.dinnerDrinks == VataKaphaDinner[mvatad]) {
              setState(() {
                rewardPoint += 16.665;
              });
            } else {
              setState(() {
                rewardPoint -= 16.665;
              });
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            dinnerfood();
            dinnerjuice();
          }
        }

        RewardPointCalculator();
      }

      Hive.openBox('point');
      Box box = Hive.box('point');
      if (box.isEmpty) {
        final fg = rewardpoint(rewardPoint);

        print("point Addded on empty");
        addpoint(fg);
      } else {
        final contact_break = box.getAt(0) as rewardpoint;
        var th = contact_break.point;
        var nr = th + rewardPoint;

        final fg = rewardpoint(nr);
        addpoint(fg);
        box.deleteAt(0);
        print("point added successfully");
      }
      var t = AppLocalizations.of(context);
      return SizedBox(
        height: 400,
        width: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "Todays Diet",
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Morning Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataKaphaBreakfastSnacks[mvatams]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "BreakFast :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataKaphaBreakfast[mvatab]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Lunch :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataKaphaLunch[mvatal]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "SideDish :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataKaphaSideDish[mvatasd]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataKaphaEveningSnacks[mvataes]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Dinner :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${VataKaphaDinner[mvatad]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else if (use == 'pitta And kapha') {
      if (day == 'monday') {
        mvatams = MonRan().monday(pkbs);
        mvatab = MonRan().monday(pkb);
        mvatal = MonRan().monday(pkl);
        mvatasd = MonRan().monday(pksd);
        mvataes = MonRan().monday(pkes);
        mvatad = MonRan().monday(pkd);
      } else if (day == 'tuesday') {
        mvatams = TueRan().tuesday(pkbs);
        mvatab = TueRan().tuesday(pkb);
        mvatal = TueRan().tuesday(pkl);
        mvatasd = TueRan().tuesday(pksd);
        mvataes = TueRan().tuesday(pkes);
        mvatad = TueRan().tuesday(pkd);
      } else if (day == 'wednesday') {
        mvatams = WedRan().wednesday(pbs);
        mvatab = WedRan().wednesday(pkb);
        mvatal = WedRan().wednesday(pkl);
        mvatasd = WedRan().wednesday(pksd);
        mvataes = WedRan().wednesday(pkes);
        mvatad = WedRan().wednesday(pkd);
      } else if (day == 'thursday') {
        mvatams = ThurRan().thursday(pkbs);
        mvatab = ThurRan().thursday(pkb);
        mvatal = ThurRan().thursday(pkl);
        mvatasd = ThurRan().thursday(pksd);
        mvataes = ThurRan().thursday(pkes);
        mvatad = ThurRan().thursday(pkd);
      } else if (day == 'friday') {
        mvatams = FriRan().friday(pkbs);
        mvatab = FriRan().friday(pkb);
        mvatal = FriRan().friday(pkl);
        mvatasd = FriRan().friday(pksd);
        mvataes = FriRan().friday(pkes);
        mvatad = FriRan().friday(pkd);
      } else if (day == 'saturday') {
        mvatams = SatRan().saturday(pkbs);
        mvatab = SatRan().saturday(pkb);
        mvatal = SatRan().saturday(pkl);
        mvatasd = SatRan().saturday(pksd);
        mvataes = SatRan().saturday(pkes);
        mvatad = SatRan().saturday(pkd);
      } else {
        mvatams = SunRan().sunday(pkbs);
        mvatab = SunRan().sunday(pkb);
        mvatal = SunRan().sunday(pkl);
        mvatasd = SunRan().sunday(pksd);
        mvataes = SunRan().sunday(pkes);
        mvatad = SunRan().sunday(pkd);
      }
      var num2 = contactBox2.length;
      for (int i = 0; i <= num2 - 1; i++) {
        final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

        Morning_snack_food() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackFood ==
                PittaKaphaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        Morning_snack_juice() {
          for (int j = 1; j <= 23; j++) {
            if (newContactBreak.morningSnackDrinks ==
                PittaKaphaBreakfastSnacks[mvatams]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            Morning_snack_food();
            Morning_snack_juice();
          }
        }

        RewardPointCalculator();
      }
      // breakfst
      var num = contactBox1.length;
      for (int i = 0; i <= num - 1; i++) {
        final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

        breakfastfood() {
          for (int j = 1; j <= 13; j++) {
            if (contact_break.breakFastFood == PittakaphaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        breakfastjuice() {
          for (int j = 1; j <= 22; j++) {
            if (contact_break.breakFastDrinks == PittakaphaBreakfast[mvatab]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            breakfastfood();
            breakfastjuice();
          }
        }

        RewardPointCalculator();
      }

      // lunch
      var num3 = contactBox3.length;
      for (int i = 0; i <= num3 - 1; i++) {
        final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

        lunchfood() {
          for (int j = 1; j <= 15; j++) {
            if (new1_contact_break.lunchFood == PittakaphaLunch[mvatal]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        lunchjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new1_contact_break.lunchDrinks == PittakaphaLunch[mvatal]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            lunchfood();
            lunchjuice();
          }
        }

        RewardPointCalculator();
      }

      // evening snacks

      var num4 = contactBox4.length;
      for (int i = 0; i <= num4 - 1; i++) {
        final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

        eveningfood() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningFood == PittakaphaSnacks[mvataes]) {
              setState(() {
                rewardPoint += 16.665;
              });
            }
          }
        }

        eveningjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new2_contact_break.eveningDrinks == PittakaphaSnacks[mvataes]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            eveningfood();
            eveningjuice();
          }
        }

        RewardPointCalculator();
      }

      //dinner

      var num5 = contactBox.length;
      for (int i = 0; i <= num5 - 1; i++) {
        final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

        dinnerfood() {
          for (int j = 1; j <= 11; j++) {
            if (new3_contact_break.dinnerFood == PittakaphaDinner[mvatad][j]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        dinnerjuice() {
          for (int j = 1; j <= 22; j++) {
            if (new3_contact_break.dinnerDrinks == PittakaphaDinner[mvatad]) {
              rewardPoint += 16.665;
            } else {
              rewardPoint -= 16.665;
            }
          }
        }

        RewardPointCalculator() async {
          final currentdate = DateTime.now().day;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          int lastDay = (prefs.getInt('day') ?? 0);
          if (currentdate != lastDay) {
            await prefs.setInt('day', currentdate);
            dinnerfood();
            dinnerjuice();
          }
        }

        RewardPointCalculator();
      }

      Hive.openBox('point');
      Box box = Hive.box('point');
      if (box.isEmpty) {
        // final fg = rewardpoint(rewardPoint);
        // print("point Addded on empty");
        // addpoint(fg);
        null;
      } else {
        final contact_break = box.getAt(0) as rewardpoint;
        var th = contact_break.point;
        var nr = th + rewardPoint;

        final fg = rewardpoint(nr);
        addpoint(fg);
        box.deleteAt(0);
        print("point added successfully");
      }
      var t = AppLocalizations.of(context);
      return SizedBox(
        height: 400,
        width: 300,
        child: Center(
          child: Column(
            children: <Widget>[
              const Center(
                child: Text(
                  "Todays Diet",
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Morning Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittaKaphaBreakfastSnacks[mvatams]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "BreakFast :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittakaphaBreakfast[mvatab]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Lunch :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittakaphaLunch[mvatal]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "SideDish :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittakaphaSideDish[mvatasd]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Snacks :",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittakaphaSnacks[mvataes]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text(
                      "Dinner:",
                      style: TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${PittakaphaDinner[mvatad]}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      var t = AppLocalizations.of(context);
      return SizedBox(
          height: 200,
          width: 150,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text("OOPS ... No data found",
                    style: TextStyle(
                        fontFamily: 'Sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text("Find your Bodytype",
                    style: TextStyle(
                        fontFamily: 'Sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 180,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 58, 62, 89),
                  child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 300,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PlanPage()));
                      },
                      child: const Text(
                        "Find BodyType..!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Sharetech"),
                      )),
                ),
              ),
            ],
          ));
    }
  }

  void showUserDialog(String bodyty, String day) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: buildCardField(bodyty, day),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    String stf() {
      Hive.openBox('vatafood');
      Hive.openBox("bodytype");
      String res = '';
      Box contactsBox = Hive.box('bodytype');

      if (contactsBox.isEmpty) {
        setState(() {
          res = 'No data';
        });
      } else {
        final contact_break = contactsBox.getAt(0) as bodytype_Contact;
        var bad_list = contact_break.bodyt;
        for (int i = 0; i <= 5; i++) {
          if (bad_list[i] == 1.0) {
            if (i == 0) {
              setState(() {
                res = 'vata';
              });
            } else if (i == 1) {
              setState(() {
                res = 'pitta';
              });
            } else if (i == 2) {
              setState(() {
                res = 'kapha';
              });
            } else if (i == 3) {
              setState(() {
                res = 'vata And pitta';
              });
            } else if (i == 4) {
              setState(() {
                res = 'vata And kapha';
              });
            } else {
              setState(() {
                res = 'pitta And kapha';
              });
            }
          }
        }
      }
      return res;
    }

    Hive.openBox('vatafood');

    //---------------------------------diet planner ------------------------------------

    String str = stf();

    print('this is your body type:$str');

    Box box5 = Hive.box('vatafood');

    var t = AppLocalizations.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: TextButton.icon(
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              label: const Text("")),
          backgroundColor: const Color.fromARGB(255, 168, 184, 139),
          title: const Text(
            "DIET PLANNER",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
        ),
        body: ListView(
          children: [
            const SizedBox(height: 30),
            CarouselSlider(
              items: [
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'monday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: const <Widget>[
                            SizedBox(height: 50),
                            CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/moon.gif'),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Your Diet For Monday",
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'tuesday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: const <Widget>[
                            SizedBox(height: 50),
                            CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/tuesday.gif'),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Your Diet For Tuesday",
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'wednesday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: const <Widget>[
                            SizedBox(height: 50),
                            CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/wednesday.gif'),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Your Diet For \n Wednesday",
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'thursday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: const <Widget>[
                            SizedBox(height: 50),
                            CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/venux.gif'),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Your Diet For Thursday",
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'friday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: const <Widget>[
                            SizedBox(height: 50),
                            CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/friday.gif'),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Your Diet For Friday",
                              style: TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'saturday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 50),
                            const CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/saturday.gif'),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "${t?.ydfs}",
                              style: const TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showUserDialog('$str', 'sunday');
                  },
                  child: Container(
                    height: 200,
                    width: 350,
                    margin: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 50),
                            const CircleAvatar(
                              maxRadius: 70,
                              backgroundImage:
                                  AssetImage('assets/images/sunday.gif'),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "${t?.ydfss}",
                              style: const TextStyle(
                                fontFamily: 'raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 360.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.75,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                height: 300,
                width: 350,
                child: Card(
                    color: Colors.grey[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/bodytype.gif')))),
                        ),
                        Center(
                            child: Text(
                          "${t?.boddy}",
                          style: const TextStyle(
                            fontFamily: 'sharetech',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )),
                        const SizedBox(height: 10),
                        Center(
                          child: Text(
                            "$str",
                            style: const TextStyle(
                              fontFamily: 'sharetech',
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

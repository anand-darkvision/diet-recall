// ignore_for_file: non_constant_identifier_names, prefer_final_fields, unused_local_variable, unused_field, unused_element, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietrecallapp/Dataset/breakfast_dataset.dart';
import 'package:dietrecallapp/Dataset/dinner_dataset.dart';
import 'package:dietrecallapp/Dataset/lunch_dataset.dart';
import 'package:dietrecallapp/Dataset/snack_dataset.dart';
import 'package:dietrecallapp/screens/notification_api.dart';
// import 'package:dietrecallapp/screens/notification_api.dart';
import 'package:dietrecallapp/screens/nutrition.dart';
import 'package:dietrecallapp/screens/plan_2.dart';
import 'package:dietrecallapp/screens/recall.dart';
import 'package:dietrecallapp/screens/report.dart';
import 'package:dietrecallapp/screens/rewards.dart';
import 'package:dietrecallapp/screens/vatapita.dart';
import 'package:dietrecallapp/usermodel/breakfast_user_model.dart';
import 'package:dietrecallapp/usermodel/dinner_user_model.dart';
import 'package:dietrecallapp/usermodel/evening_user_model.dart';
import 'package:dietrecallapp/usermodel/lunch_user_model.dart';
import 'package:dietrecallapp/usermodel/moringsnack_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../providers/google_sign_in.dart';
import '../providers/user_model.dart';
import '../usermodel/warning_user_model.dart';
import '../usermodel/water.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var water = 0;
  TextEditingController _water = TextEditingController();
  late Box box1;
  final contactBox = Hive.box('dinner');
  final contactBox1 = Hive.box("recall");
  final contactBox2 = Hive.box("morningSnack");
  final contactBox3 = Hive.box("lunch");
  final contactBox4 = Hive.box("evening");

  UserModel loggedInUser = UserModel();
  User? user = FirebaseAuth.instance.currentUser!;

  late List<GDPData> _chartData;

  //breakfast..
  var _fooBreakItemCal = [];
  var _fooBreakItemPro = [];
  var _fooBreakItemFat = [];
  var _fooBreakItemCarb = [];

  var _juBreakItemCal = [];
  var _juBreakItemPro = [];
  var _juBreakItemFat = [];
  var _juBreakItemCarb = [];

  //morningsnacks
  var _fooMorSnakItemCal = [];
  var _fooMorSnakItemPro = [];
  var _fooMorSnakItemFat = [];
  var _fooMorSnakItemCarb = [];

  var _juMorSnakItemCal = [];
  var _juMorSnakItemPro = [];
  var _juMorSnakItemFat = [];
  var _juMorSnakItemCarb = [];

  //lunch
  var _foolunchItemCal = [];
  var _foolunchItemPro = [];
  var _foolunchItemFat = [];
  var _foolunchItemCarb = [];

  var _julunchItemCal = [];
  var _julunchItemPro = [];
  var _julunchItemFat = [];
  var _julunchItemCarb = [];

  //evening snacks
  var _fooevenItemCal = [];
  var _fooevenItemPro = [];
  var _fooevenItemFat = [];
  var _fooevenItemCarb = [];

  var _juevenItemCal = [];
  var _juevenItemPro = [];
  var _juevenItemFat = [];
  var _juevenItemCarb = [];

  //dinner
  var _foodinnerItemCal = [];
  var _foodinnerItemPro = [];
  var _foodinnerItemFat = [];
  var _foodinnerItemCarb = [];

  var _judinnerItemCal = [];
  var _judinnerItemPro = [];
  var _judinnerItemFat = [];
  var _judinnerItemCarb = [];

  late TooltipBehavior _tooltipBehavior;

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Protein', 0),
      GDPData('Carbohydrates', 0),
      GDPData('Fat', 0),
      GDPData('Calories', 0),
    ];
    return chartData;
  }

  FirebaseFirestore Firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    NotificationApi.showNotification(
        title: 'Idle Alert',
        body: "you Have been IDLE for more than a hour",
        scheduledDate: DateTime.now().add(Duration(seconds: 3)));
    NotificationApi.showNotification(
        title: 'Water Alert',
        body: "Have a Glass Of Water",
        scheduledDate: DateTime.now().add(Duration(hours: 2)));
    Hive.openBox("water");
    Hive.openBox('vatpit');
    setState(() {
      //breakfast
      _fooBreakItemCal.length = 0;
      _fooBreakItemPro.length = 0;
      _fooBreakItemFat.length = 0;
      _fooBreakItemCarb.length = 0;

      _juBreakItemCal.length = 0;
      _juBreakItemPro.length = 0;
      _juBreakItemFat.length = 0;
      _juBreakItemCarb.length = 0;

      //morning snacks
      _fooMorSnakItemCal.length = 0;
      _fooMorSnakItemPro.length = 0;
      _fooMorSnakItemFat.length = 0;
      _fooMorSnakItemCarb.length = 0;

      _juMorSnakItemCal.length = 0;
      _juMorSnakItemPro.length = 0;
      _juMorSnakItemFat.length = 0;
      _juMorSnakItemCarb.length = 0;

      //lunch
      _foolunchItemCal.length = 0;
      _foolunchItemFat.length = 0;
      _foolunchItemPro.length = 0;
      _foolunchItemCarb.length = 0;

      _julunchItemCal.length = 0;
      _julunchItemPro.length = 0;
      _julunchItemFat.length = 0;
      _julunchItemCarb.length = 0;

      // evening snacks
      _fooevenItemCal.length = 0;
      _fooevenItemPro.length = 0;
      _fooevenItemFat.length = 0;
      _fooevenItemCarb.length = 0;

      _juevenItemCal.length = 0;
      _juevenItemPro.length = 0;
      _juevenItemFat.length = 0;
      _juevenItemCarb.length = 0;

      //dinner
      _foodinnerItemCal.length = 0;
      _foodinnerItemPro.length = 0;
      _foodinnerItemFat.length = 0;
      _foodinnerItemCarb.length = 0;

      _judinnerItemCal.length = 0;
      _judinnerItemPro.length = 0;
      _judinnerItemFat.length = 0;
      _judinnerItemCarb.length = 0;
    });
    super.initState();
    createBox();

    NotificationApi.init();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  firstName() {
    if ("${loggedInUser.firstName}".endsWith("null")) {
      return "${user?.displayName}";
    } else {
      return "${loggedInUser.firstName}";
    }
  }

  email() {
    if ("${loggedInUser.email}".endsWith("null")) {
      return "${user?.email}";
    } else {
      return "${loggedInUser.email}";
    }
  }

  late Box contactsBox;

  void createBox() async {
    box1 = await Hive.openBox('vatpit');
    Hive.openBox("water");
    contactsBox = await Hive.openBox('water');
  }

  void addFood(Warning_Contact contact) {
    final contactBox = Hive.box('warning');
    contactBox.add(contact);
  }

  //morning snack food
  dynamic monrSnaSumFoodCal = 0;
  dynamic monrSnaSumFoodPro = 0;
  dynamic monrSnaSumFoodFat = 0;
  dynamic monrSnaSumFoodCarb = 0;

  dynamic monrSnaSumJuiceCal = 0;
  dynamic monrSnaSumJuicePro = 0;
  dynamic monrSnaSumJuiceFat = 0;
  dynamic monrSnaSumJuiceCarb = 0;

  //break fast food
  dynamic break_sum_food_cal = 0;
  dynamic break_sum_food_pro = 0;
  dynamic break_sum_food_fat = 0;
  dynamic break_sum_food_carb = 0;

  dynamic break_sum_juice_cal = 0;
  dynamic break_sum_juice_pro = 0;
  dynamic break_sum_juice_fat = 0;
  dynamic break_sum_juice_carb = 0;

  //lunch food
  dynamic lunch_sum_food_cal = 0;
  dynamic lunch_sum_food_pro = 0;
  dynamic lunch_sum_food_fat = 0;
  dynamic lunch_sum_food_carb = 0;

  //lunch juice
  dynamic lunch_sum_juice_cal = 0;
  dynamic lunch_sum_juice_pro = 0;
  dynamic lunch_sum_juice_fat = 0;
  dynamic lunch_sum_juice_carb = 0;

  //food
  dynamic even_sum_food_cal = 0;
  dynamic even_sum_food_pro = 0;
  dynamic even_sum_food_fat = 0;
  dynamic even_sum_food_carb = 0;

  //juice
  dynamic even_sum_juice_cal = 0;
  dynamic even_sum_juice_pro = 0;
  dynamic even_sum_juice_fat = 0;
  dynamic even_sum_juice_carb = 0;

  //food
  dynamic dinner_sum_food_cal = 0;
  dynamic dinner_sum_food_pro = 0;
  dynamic dinner_sum_food_fat = 0;
  dynamic dinner_sum_food_carb = 0;

  //juice
  dynamic dinner_sum_juice_cal = 0;
  dynamic dinner_sum_juice_pro = 0;
  dynamic dinner_sum_juice_fat = 0;
  dynamic dinner_sum_juice_carb = 0;

  //dataset access
  //breakfast
  var a1 = BreakFast_dataset().getbreakfast();
  var a2 = BreakFast_dataset().getbreakfastcal();
  var a3 = BreakFast_dataset().getbreakfastpro();
  var a4 = BreakFast_dataset().getbreakfastfat();
  var a5 = BreakFast_dataset().getbreakfastcarb();
  //snacks
  var b1 = Snacks_dataset().getsnacks();
  var b2 = Snacks_dataset().getsnackcal();
  var b3 = Snacks_dataset().getsnackpro();
  var b4 = Snacks_dataset().getsnackfats();
  var b5 = Snacks_dataset().getsnackcarbs();
  //lunch
  var c1 = Lunch_dataset().getlunch();
  var c2 = Lunch_dataset().getlunchcal();
  var c3 = Lunch_dataset().getlunchpro();
  var c4 = Lunch_dataset().getfoodfats();
  var c5 = Lunch_dataset().getfoodcarbs();
  //dinner
  var d1 = Dinners_dataset().getdinner();
  var d2 = Dinners_dataset().getdinnercal();
  var d3 = Dinners_dataset().getdinnerpro();
  var d4 = Dinners_dataset().getdinnerfats();
  var d5 = Dinners_dataset().getdinnercarbs();

  morningsnack() {
    var num2 = contactBox2.length;
    for (int i = 0; i <= num2 - 1; i++) {
      final newContactBreak = contactBox2.getAt(i) as Morningsnack_Contact;

      Morning_snack_food() {
        for (int j = 1; j <= 24; j++) {
          if (newContactBreak.morningSnackFood == b1[j]) {
            _fooMorSnakItemCal
                .add(b2[j] * newContactBreak.morningSnackServings);
            _fooMorSnakItemPro
                .add(b3[j] * newContactBreak.morningSnackServings);
            _fooMorSnakItemFat
                .add(b4[j] * newContactBreak.morningSnackServings);
            _fooMorSnakItemCarb
                .add(b5[j] * newContactBreak.morningSnackServings);
          }
        }
      }

      Morning_snack_juice() {
        for (int j = 1; j <= 24; j++) {
          if (newContactBreak.morningSnackDrinks == b1[j]) {
            _juMorSnakItemCal.add(b2[j] * newContactBreak.morningSnackGlass);
            _juMorSnakItemPro.add(b3[j] * newContactBreak.morningSnackGlass);
            _juMorSnakItemFat.add(b4[j] * newContactBreak.morningSnackGlass);
            _juMorSnakItemCarb.add(b5[j] * newContactBreak.morningSnackGlass);
          }
        }
      }

      (newContactBreak.morningSnackFood.contains("0"))
          ? null
          : Morning_snack_food();
      (newContactBreak.morningSnackDrinks.toString().contains("0"))
          ? null
          : Morning_snack_juice();
    }

    //morning snacks food
    for (dynamic f in _fooMorSnakItemCal) {
      monrSnaSumFoodCal += f;
    }
    for (dynamic h in _fooMorSnakItemPro) {
      monrSnaSumFoodPro += h;
    }
    for (dynamic m in _fooMorSnakItemFat) {
      monrSnaSumFoodFat += m;
    }
    for (dynamic q in _fooMorSnakItemCarb) {
      monrSnaSumFoodCarb += q;
    }

    //morning snacks juice
    for (dynamic g in _juMorSnakItemCal) {
      monrSnaSumJuiceCal += g;
    }
    for (dynamic h in _juMorSnakItemPro) {
      monrSnaSumJuicePro += h;
    }
    for (dynamic e in _juMorSnakItemFat) {
      monrSnaSumJuiceFat += e;
    }
    for (dynamic f in _juMorSnakItemCarb) {
      monrSnaSumJuiceCarb += f;
    }
  }

  breakfast() {
    var num = contactBox1.length;
    for (int i = 0; i <= num - 1; i++) {
      final contact_break = contactBox1.getAt(i) as Breakfast_Contact;

      breakfastfood() {
        for (int j = 1; j <= 165; j++) {
          if (contact_break.breakFastFood == a1[j]) {
            _fooBreakItemCal.add(a2[j] * contact_break.breakFastServings);
            _fooBreakItemPro.add(a3[j] * contact_break.breakFastServings);
            _fooBreakItemFat.add(a4[j] * contact_break.breakFastServings);
            _fooBreakItemCarb.add(a5[j] * contact_break.breakFastServings);
          }
        }
      }

      breakfastjuice() {
        for (int j = 1; j <= 23; j++) {
          if (contact_break.breakFastDrinks == b1[j]) {
            _juBreakItemCal.add(b2[j] * contact_break.breakFastGlass);
            _juBreakItemPro.add(b3[j] * contact_break.breakFastGlass);
            _juBreakItemFat.add(b4[j] * contact_break.breakFastGlass);
            _juBreakItemCarb.add(b5[j] * contact_break.breakFastGlass);
          }
        }
      }

      (contact_break.breakFastFood.contains("0")) ? null : breakfastfood();
      (contact_break.breakFastDrinks.toString().contains("0"))
          ? null
          : breakfastjuice();
    }

    //break fast juice
    for (dynamic f in _fooBreakItemCal) {
      break_sum_food_cal += f;
    }
    for (dynamic w in _fooBreakItemPro) {
      break_sum_food_pro += w;
    }
    for (dynamic y in _fooBreakItemFat) {
      break_sum_food_fat += y;
    }
    for (dynamic r in _fooBreakItemCarb) {
      break_sum_food_carb += r;
    }
    //breakfast juice
    for (dynamic g in _juBreakItemCal) {
      break_sum_juice_cal += g;
    }
    for (dynamic h in _juBreakItemPro) {
      break_sum_juice_pro += h;
    }
    for (dynamic i in _juBreakItemFat) {
      break_sum_juice_fat += i;
    }
    for (dynamic j in _juBreakItemCarb) {
      break_sum_juice_carb += j;
    }
  }

  lunch() {
    var num3 = contactBox3.length;
    for (int i = 0; i <= num3 - 1; i++) {
      final new1_contact_break = contactBox3.getAt(i) as lunch_Contact;

      lunchfood() {
        for (int j = 1; j <= 15; j++) {
          if (new1_contact_break.lunchFood == c1[j]) {
            _foolunchItemCal.add(c2[j] * new1_contact_break.lunchServings);
            _foolunchItemPro.add(c3[j] * new1_contact_break.lunchServings);
            _foolunchItemFat.add(c4[j] * new1_contact_break.lunchServings);
            _foolunchItemCarb.add(c5[j] * new1_contact_break.lunchServings);
          }
        }
      }

      lunchjuice() {
        for (int j = 1; j <= 23; j++) {
          if (new1_contact_break.lunchDrinks == b1[j]) {
            _julunchItemCal.add(b2[j] * new1_contact_break.lunchGlass);
            _julunchItemPro.add(b3[j] * new1_contact_break.lunchGlass);
            _julunchItemFat.add(b4[j] * new1_contact_break.lunchGlass);
            _julunchItemCarb.add(b5[j] * new1_contact_break.lunchGlass);
          }
        }
      }

      (new1_contact_break.lunchFood.contains("0")) ? null : lunchfood();
      (new1_contact_break.lunchDrinks.toString().contains("0"))
          ? null
          : lunchjuice();
    }

    //food
    for (dynamic f in _foolunchItemCal) {
      lunch_sum_food_cal += f;
    }
    for (dynamic d in _foolunchItemPro) {
      lunch_sum_food_pro += d;
    }
    for (dynamic t in _foolunchItemFat) {
      lunch_sum_juice_fat += t;
    }
    for (dynamic s in _foolunchItemCarb) {
      lunch_sum_food_carb += s;
    }

    //juice
    for (dynamic g in _julunchItemCal) {
      lunch_sum_juice_cal += g;
    }
    for (dynamic j in _julunchItemPro) {
      lunch_sum_juice_pro += j;
    }
    for (dynamic d in _julunchItemFat) {
      lunch_sum_juice_fat += d;
    }
    for (dynamic c in _julunchItemCarb) {
      lunch_sum_juice_carb += c;
    }
  }

  eveningsnacks() {
    var num4 = contactBox4.length;
    for (int i = 0; i <= num4 - 1; i++) {
      final new2_contact_break = contactBox4.getAt(i) as evening_Contact;

      eveningfood() {
        for (int j = 1; j <= 24; j++) {
          if (new2_contact_break.eveningFood == b1[j]) {
            _fooevenItemCal.add(b2[j] * new2_contact_break.eveningServings);
            _fooevenItemPro.add(b3[j] * new2_contact_break.eveningServings);
            _fooevenItemFat.add(b4[j] * new2_contact_break.eveningServings);
            _fooevenItemCarb.add(b5[j] * new2_contact_break.eveningServings);
          }
        }
      }

      eveningjuice() {
        for (int j = 1; j <= 24; j++) {
          if (new2_contact_break.eveningDrinks == b1[j]) {
            _juevenItemCal.add(b2[j] * new2_contact_break.eveningGlass);
            _juevenItemPro.add(b3[j] * new2_contact_break.eveningGlass);
            _juevenItemFat.add(b4[j] * new2_contact_break.eveningGlass);
            _juevenItemCarb.add(b5[j] * new2_contact_break.eveningGlass);
          }
        }
      }

      (new2_contact_break.eveningFood.contains("0")) ? null : eveningfood();
      (new2_contact_break.eveningDrinks.toString().contains("0"))
          ? null
          : eveningjuice();
    }

    //food
    for (dynamic f in _fooevenItemCal) {
      even_sum_food_cal += f;
    }
    for (dynamic f in _fooevenItemPro) {
      even_sum_food_pro += f;
    }
    for (dynamic f in _fooevenItemFat) {
      even_sum_food_fat += f;
    }
    for (dynamic f in _fooevenItemCarb) {
      even_sum_food_carb += f;
    }
    //juice
    for (dynamic g in _juevenItemCal) {
      even_sum_juice_cal += g;
    }
    for (dynamic g in _juevenItemPro) {
      even_sum_juice_pro += g;
    }
    for (dynamic g in _juevenItemFat) {
      even_sum_juice_fat += g;
    }
    for (dynamic g in _juevenItemCarb) {
      even_sum_juice_carb += g;
    }
  }

  dinner() {
    var num5 = contactBox.length;
    for (int i = 0; i <= num5 - 1; i++) {
      final new3_contact_break = contactBox.getAt(i) as Dinner_Contact;

      dinnerfood() {
        for (int j = 1; j <= 153; j++) {
          if (new3_contact_break.dinnerFood == d1[j]) {
            _foodinnerItemCal.add(d2[j] * new3_contact_break.dinnerServings);
            _foodinnerItemPro.add(d3[j] * new3_contact_break.dinnerServings);
            _foodinnerItemFat.add(d4[j] * new3_contact_break.dinnerServings);
            _foodinnerItemCarb.add(d5[j] * new3_contact_break.dinnerServings);
          }
        }
      }

      dinnerjuice() {
        for (int j = 1; j <= 23; j++) {
          if (new3_contact_break.dinnerDrinks == b1[j]) {
            _judinnerItemCal.add(b2[j] * new3_contact_break.dinnerGlass);
            _judinnerItemPro.add(b3[j] * new3_contact_break.dinnerGlass);
            _judinnerItemFat.add(b4[j] * new3_contact_break.dinnerGlass);
            _judinnerItemCarb.add(b5[j] * new3_contact_break.dinnerGlass);
          }
        }
      }

      (new3_contact_break.dinnerFood.contains("0")) ? null : dinnerfood();
      (new3_contact_break.dinnerDrinks.toString().contains("0"))
          ? null
          : dinnerjuice();
    }

    //food
    for (int f in _foodinnerItemCal) {
      dinner_sum_food_cal += f;
    }
    for (dynamic f in _foodinnerItemPro) {
      dinner_sum_food_pro += f;
    }
    for (dynamic f in _foodinnerItemFat) {
      dinner_sum_food_fat += f;
    }
    for (dynamic f in _foodinnerItemCarb) {
      dinner_sum_food_carb += f;
    }

    //dinner
    for (dynamic g in _judinnerItemCal) {
      dinner_sum_juice_cal += g;
    }
    for (dynamic d in _judinnerItemPro) {
      dinner_sum_juice_pro += d;
    }
    for (dynamic g in _judinnerItemFat) {
      dinner_sum_juice_fat += g;
    }
    for (dynamic d in _judinnerItemCarb) {
      dinner_sum_juice_carb += d;
    }
  }

  @override
  Widget build(BuildContext context) {
    Hive.openBox("water");
    // lang
    var t = AppLocalizations.of(context);
    morningsnack();
    breakfast();
    lunch();
    eveningsnacks();
    dinner();
    Hive.openBox("water");
    final contact1Box = Hive.box("water");
    void addwater(Water contact) {
      contact1Box.add(contact);
    }

    dynamic firstNameResult = firstName();
    AssetImage image = const AssetImage("assets/images/user.png");
    NetworkImage network = NetworkImage("${user?.photoURL}");

    profileImage() {
      Object imageNew =
          "${loggedInUser.firstName}".endsWith("null") ? network : image;
      return imageNew;
    }

    dynamic profileImageResult = profileImage();

    var total_cal = monrSnaSumFoodCal +
        monrSnaSumJuiceCal +
        break_sum_food_cal +
        break_sum_juice_cal +
        lunch_sum_food_cal +
        lunch_sum_juice_cal +
        even_sum_food_cal +
        even_sum_juice_cal +
        dinner_sum_juice_cal +
        dinner_sum_food_cal;

    var total_pro = monrSnaSumFoodPro +
        monrSnaSumJuicePro +
        break_sum_food_pro +
        break_sum_juice_pro +
        lunch_sum_food_pro +
        lunch_sum_juice_pro +
        even_sum_food_pro +
        even_sum_juice_pro +
        dinner_sum_juice_pro +
        dinner_sum_food_pro;

    var total_fat = monrSnaSumFoodFat +
        monrSnaSumJuiceFat +
        break_sum_food_fat +
        break_sum_juice_fat +
        lunch_sum_food_fat +
        lunch_sum_juice_fat +
        even_sum_food_fat +
        even_sum_juice_fat +
        dinner_sum_juice_fat +
        dinner_sum_food_fat;

    var total_carbs = monrSnaSumFoodCarb +
        monrSnaSumJuiceCarb +
        break_sum_food_carb +
        break_sum_juice_carb +
        lunch_sum_food_carb +
        lunch_sum_juice_carb +
        even_sum_food_carb +
        even_sum_juice_carb +
        dinner_sum_juice_carb +
        dinner_sum_food_carb;

    List<GDPData> _newUpdatedData() {
      _chartData.add(GDPData('Protien', total_pro.round()));
      _chartData.add(GDPData('Carbohydrates', total_carbs.round()));
      _chartData.add(GDPData('Fat', total_fat.round()));
      _chartData.add(GDPData('Calories', total_cal.round()));
      return _chartData;
    }

    setState(() {
      _chartData = <GDPData>[];
      _chartData = _newUpdatedData();
    });

    getwater() {
      Hive.openBox('water');
      Box gh = Hive.box('water');
      if (gh.isEmpty) {
        return 0;
      } else {
        final contact_break = contactsBox.getAt(0) as Water;
        int water = contact_break.water;
        return water;
      }
    }

    Widget buildTextField(String hint, TextEditingController contText) {
      return Container(
        margin: const EdgeInsets.all(4.0),
        child: TextField(
            cursorColor: Colors.black,
            controller: contText,
            autofocus: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              labelText: hint,
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2.0,
                  style: BorderStyle.solid,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 95, 96, 96),
                ),
              ),
            )),
      );
    }

    Widget buildCardField() {
      return SizedBox(
        height: 250,
        width: 200,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(width: 55),
                  const Icon(Icons.water_drop_outlined),
                  const SizedBox(width: 10),
                  Text("${t?.water}",
                      style: const TextStyle(
                        fontFamily: 'sharetech',
                        fontSize: 40,
                      )),
                ],
              ),
              Center(
                child: Text(
                  "${t?.drinkminimal}",
                  style: const TextStyle(
                    fontFamily: 'sharetech',
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Text(
                  "${t?.perday}",
                  style: const TextStyle(
                    fontFamily: 'sharetech',
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              buildTextField("${t?.glass300}", _water),
              const SizedBox(height: 15),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 66, 66, 67),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: 140,
                  onPressed: () async {
                    await Hive.openBox('water');
                    Box box = Hive.box('water');
                    if (box.isEmpty) {
                      var rt = int.parse(_water.text);
                      final fg = Water(rt);
                      setState(() {
                        print("Addded on empty");

                        addwater(fg);
                        final contact_break = box.getAt(0) as Water;
                        var th = contact_break.water;
                        Firestore.collection('users')
                            .doc(user?.uid)
                            .set({"water": th}, SetOptions(merge: true));
                      });
                    } else {
                      final contact_break = box.getAt(0) as Water;
                      var th = contact_break.water;
                      var nr = th + int.parse(_water.text);
                      setState(() {
                        final fg = Water(nr);
                        addwater(fg);
                        box.deleteAt(0);
                        print("added successfully");
                        print(th);
                        Firestore.collection('users')
                            .doc(user?.uid)
                            .set({"water": th}, SetOptions(merge: true));
                      });
                    }

                    _water.clear();

                    Navigator.pop(context);
                  },
                  child: Text(
                    "${t?.add}",
                    style: const TextStyle(
                      fontFamily: 'sharetech',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    void showUserDialog() {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: buildCardField(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
          });
    }

    int wat = getwater();
    //------------------------------------------------------calorie end here -----------------------------------
    return SafeArea(
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
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundImage: profileImageResult,
                          radius: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "$firstNameResult",
                          style: const TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 0,
                    height: 0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Material(
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
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
                          const SizedBox(width: 0.0),
                          const Icon(
                            Icons.home,
                            size: 30,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "${t?.home}",
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
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Recall()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 0.0),
                          Icon(
                            Icons.refresh_rounded,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${t?.recall}",
                            style: TextStyle(
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
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PlanPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 0.0),
                          Icon(
                            Icons.menu_book_outlined,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${t?.fndbo}",
                            style: TextStyle(
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
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const DietChart()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 0.0),
                          Icon(
                            Icons.youtube_searched_for,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${t?.dietplan}",
                            style: TextStyle(
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
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Reward()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 0.0),
                          Icon(
                            Icons.wine_bar_sharp,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${t?.reward}",
                            style: TextStyle(
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
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Nutrition()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 0.0),
                          Icon(
                            Icons.wysiwyg,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${t?.nutritionf}",
                            style: TextStyle(
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
                    elevation: 0,
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: 210,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const ReportPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(width: 0.0),
                          Icon(
                            Icons.account_balance_wallet_sharp,
                            size: 30,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${t?.getrep}",
                            style: TextStyle(
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
                  const SizedBox(height: 180),
                  SizedBox(
                    height: 55,
                    width: 200,
                    child: Center(
                      child: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 168, 184, 139),
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: 210,
                          onPressed: () {
                            Hive.box('recall').compact();
                            Hive.box('morningSnack').compact();
                            Hive.box('lunch').compact();
                            Hive.box('evening').compact();
                            Hive.box('dinner').compact();
                            Hive.box('vatpit').compact();
                            Hive.box('warning').compact();
                            Hive.box('bodytype').compact();
                            Hive.box('water').compact();
                            Hive.close();
                            super.dispose();
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.logOut(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 0.0),
                              Icon(
                                Icons.logout,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "${t?.logout}",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "${t?.home}",
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  height: 600,
                  width: 350,
                  child: Card(
                    color: Colors.white,
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: SfCircularChart(
                        title: ChartTitle(
                          text: '${t?.yourdietvalue}',
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                            fontFamily: 'inter',
                          ),
                        ),
                        legend: Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap,
                          width: '15',
                          textStyle: const TextStyle(
                              fontSize: 19,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w400),
                          iconHeight: 20,
                          iconWidth: 20,
                          padding: 10,
                        ),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          RadialBarSeries<GDPData, String>(
                              dataSource: _chartData,
                              xValueMapper: (GDPData data, _) => data.nutrition,
                              yValueMapper: (GDPData data, _) => data.value,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                              enableTooltip: true,
                              trackBorderWidth: 10,
                              radius: "160",
                              gap: "8",
                              innerRadius: "28",
                              maximumValue: 10000)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 30),
                    Text(
                      "${t?.totalglass}",
                      style: TextStyle(
                        fontFamily: 'Sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$wat",
                      style: const TextStyle(
                        fontFamily: 'Sharetech',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 58, 62, 89),
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: 90,
                          onPressed: () {
                            var df = Hive.box('water');
                            df.clear();
                            setState(() {});
                            Firestore.collection('users')
                                .doc(user?.uid)
                                .set({'water': 0}, SetOptions(merge: true));
                          },
                          child: Text(
                            "${t?.clearw}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Sharetech"),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    height: 200,
                    width: 350,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          CircularPercentIndicator(
                            radius: 100,
                            lineWidth: 12.0,
                            percent: 0.5,
                            progressColor: Color.fromARGB(255, 140, 151, 122),
                            backgroundColor: Color.fromARGB(255, 177, 182, 166),
                            circularStrokeCap: CircularStrokeCap.round,
                            animation: true,
                            center: Text(
                              "37%",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            footer: Text(
                              "\n\nVata",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            animationDuration: 4000,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CircularPercentIndicator(
                            radius: 100,
                            lineWidth: 12.0,
                            percent: 0.3,
                            progressColor: Color.fromARGB(255, 140, 151, 122),
                            backgroundColor: Color.fromARGB(255, 177, 182, 166),
                            circularStrokeCap: CircularStrokeCap.round,
                            animation: true,
                            center: Text(
                              "36%",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            footer: Text(
                              "\n\npitta",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            animationDuration: 4000,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          CircularPercentIndicator(
                            radius: 100,
                            lineWidth: 12.0,
                            percent: 0.2,
                            progressColor: Color.fromARGB(255, 140, 151, 122),
                            backgroundColor: Color.fromARGB(255, 177, 182, 166),
                            circularStrokeCap: CircularStrokeCap.round,
                            animation: true,
                            center: Text(
                              "27%",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            footer: Text(
                              "\n\nkapha",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            animationDuration: 4000,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 58, 62, 89),
          onPressed: () {
            showUserDialog();
          },
          child: const Icon(
            Icons.water_drop,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            color: const Color.fromARGB(255, 168, 184, 139),
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Container(
              height: 60,
            )),
      ),
    );
  }
}

class GDPData {
  GDPData(this.nutrition, this.value);
  final String nutrition;
  final int value;
}
//Color.fromARGB(255, 41, 195, 206),

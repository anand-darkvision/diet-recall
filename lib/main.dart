import 'package:dietrecallapp/providers/google_sign_in.dart';
import 'package:dietrecallapp/screens/splashScreen.dart';
import 'package:dietrecallapp/usermodel/bodytype.dart';
import 'package:dietrecallapp/usermodel/breakfast_user_model.dart';
import 'package:dietrecallapp/usermodel/dinner_user_model.dart';
import 'package:dietrecallapp/usermodel/evening_user_model.dart';
import 'package:dietrecallapp/usermodel/lunch_user_model.dart';
import 'package:dietrecallapp/usermodel/moringsnack_user_model.dart';
import 'package:dietrecallapp/usermodel/rewardpoint.dart';
import 'package:dietrecallapp/usermodel/vatafood.dart';
import 'package:dietrecallapp/usermodel/vatpitta_user_model.dart';
import 'package:dietrecallapp/usermodel/warning_user_model.dart';
import 'package:dietrecallapp/usermodel/water.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(BreakfastContactAdapter());
  Hive.registerAdapter(DinnerContactAdapter());
  Hive.registerAdapter(eveningContactAdapter());
  Hive.registerAdapter(lunchContactAdapter());
  Hive.registerAdapter(MorningsnackContactAdapter());
  Hive.registerAdapter(VatPittaContactAdapter());
  Hive.registerAdapter(WarningContactAdapter());
  Hive.registerAdapter(bodytypeContactAdapter());
  Hive.registerAdapter(VataFoodcContactAdapter());
  Hive.registerAdapter(WaterAdapter());
  Hive.registerAdapter(rewardpointAdapter());
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: const SplashScreen(),
        ),
      );
}

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dietrecallapp/screens/page_google_sign_in_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const PageSwitcher(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 168, 184, 139),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              Container(
                height: 300,
                width: 380,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(300),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/splash.gif"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 70.0,
                    fontFamily: 'Sharetech',
                  ),
                  child: AnimatedTextKit(
                    pause: const Duration(milliseconds: 150),
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      ScaleAnimatedText(t!.appTitle),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

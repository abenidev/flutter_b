import 'package:b/controllers/data_controller.dart';
import 'package:b/controllers/setting_controller.dart';
import 'package:b/controllers/user_controller.dart';
import 'package:b/views/home_screen.dart';
import 'package:b/views/intro_screen.dart';
import 'package:b/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  void initState() {
    checkAndNavigate();
    super.initState();
  }

  void checkAndNavigate() {
    Future.delayed(const Duration(milliseconds: 100), () {
      bool isIntroSeen = Get.find<SettingController>().isIntroSeen();
      bool isBudgetEntered = Get.find<DataController>().isBudgetEntered();
      if (!isIntroSeen) {
        debugPrint('Navigating to Intro screen...');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const IntroScreen()));
      } else if (isIntroSeen && !isBudgetEntered) {
        debugPrint('Navigating to Start screen...');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartScreen()));
      } else if (isIntroSeen && isBudgetEntered) {
        debugPrint('Navigating to Home screen...');
        Get.find<DataController>().assignBudget();
        Get.find<UserController>().assignUser();

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}

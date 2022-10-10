import 'package:b/constants/assets.dart';
import 'package:b/constants/strings.dart';
import 'package:b/controllers/setting_controller.dart';
import 'package:b/views/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../components/custom_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Expanded(
              child: Container(
                child: Lottie.asset(kIntroAsset, width: 85.w, height: 85.h),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text(
                        kIntroScreenTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 26.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        kIntroScreenSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                      ),
                    ),
                    CustomButton(
                      onPress: () {
                        Get.find<SettingController>().createSetting();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StartScreen()));
                      },
                      // onPress: () => Navigator.of(context).push(PageRouteBuilder(opaque: false, pageBuilder: (context, animation, secondaryAnimation) => const StartScreen())),
                      label: 'Start',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

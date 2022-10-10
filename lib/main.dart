import 'package:b/constants/colors.dart';
import 'package:b/constants/strings.dart';
import 'package:b/controllers/data_controller.dart';
import 'package:b/controllers/date_controller.dart';
import 'package:b/controllers/setting_controller.dart';
import 'package:b/controllers/user_controller.dart';
import 'package:b/models/budget.dart';
import 'package:b/models/setting.dart';
import 'package:b/models/user.dart';
import 'package:b/views/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white.withOpacity(0.0)));

  //
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(BudgetAdapter());
  Hive.registerAdapter(SettingAdapter());

  await Hive.openBox<User>(kUserBoxString);
  await Hive.openBox<Budget>(kBudgetBoxString);
  await Hive.openBox<Setting>(kSettingBoxString);

  //
  Get.put<UserController>(UserController());
  Get.put<DataController>(DataController());
  Get.put<SettingController>(SettingController());
  Get.put<DateController>(DateController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'B',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: kbgColor,
              secondary: kbgColor,
            ),
            scaffoldBackgroundColor: kbgColor,
          ),
          home: const Root(),
        );
      },
    );
  }
}

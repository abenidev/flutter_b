import 'package:b/constants/strings.dart';
import 'package:b/models/budget.dart';
import 'package:b/models/setting.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class Boxes {
  static Box<User> getUserBox() => Hive.box<User>(kUserBoxString);
  static Box<Budget> getBudgetBox() => Hive.box<Budget>(kBudgetBoxString);
  static Box<Setting> getSettingBox() => Hive.box<Setting>(kSettingBoxString);
}

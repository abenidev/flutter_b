import 'package:b/constants/strings.dart';
import 'package:b/utils/boxes.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/setting.dart';

class SettingController extends GetxController {
  //
  final settingBox = Boxes.getSettingBox();
  final String settingKey = '1';

  Future<void> createSetting() async {
    Setting setting = Setting(isIntroSeen: true);
    await settingBox.clear();
    await settingBox.put(settingKey, setting);
  }

  Future<void> clearSetting() async {
    await settingBox.clear();
  }

  bool isIntroSeen() {
    if (settingBox.isEmpty) {
      return false;
    }
    Setting? setting = settingBox.get(settingKey);
    if (setting!.isIntroSeen) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onClose() {
    Hive.box<Setting>(kSettingBoxString).close();
    super.onClose();
  }
}

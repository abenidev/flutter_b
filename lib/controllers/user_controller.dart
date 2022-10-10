import 'package:b/constants/strings.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';
import '../utils/boxes.dart';

class UserController extends GetxController {
  final userBox = Boxes.getUserBox();
  final userBoxKey = '1';
  late User? _user;
  //

  Future<void> createUser(String name) async {
    if (userBox.isEmpty) {
      User user = User(name: name);
      _user = user;
      await userBox.clear();
      await userBox.put(userBoxKey, user);
      update();
    }
  }

  void assignUser() {
    if (userBox.isNotEmpty) {
      _user = userBox.get(userBoxKey);
      update();
    }
  }

  User? getUser() {
    if (userBox.isEmpty) return User(name: 'Error');
    return _user;
  }

  @override
  void onClose() {
    Hive.box(kUserBoxString).close();
    super.onClose();
  }
}

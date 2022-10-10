import 'package:b/controllers/data_controller.dart';
import 'package:get/get.dart';

import '../models/budget.dart';

class DateController extends GetxController {
  //
  final DateTime _now = DateTime.now();

  int? getDateDifference() {
    Budget? budget = Get.find<DataController>().getBudget();
    if (budget != null) {
      return _now.difference(DateTime.parse(budget.date)).inDays;
    } else {
      return null;
    }
  }
}

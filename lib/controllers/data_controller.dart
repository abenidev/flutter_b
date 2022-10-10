import 'package:b/constants/strings.dart';
import 'package:b/controllers/date_controller.dart';
import 'package:b/models/budget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../utils/boxes.dart';

class DataController extends GetxController {
  //
  final budgetBox = Boxes.getBudgetBox();
  final String budgetKey = '1';
  late Budget? _budget;

  void createBudget(int budget, int dailyExpense, int monthlyIncome, int incomeDay) async {
    if (budgetBox.isEmpty) {
      Budget b = Budget(
        budget: budget,
        dailyExpense: dailyExpense,
        monthlyIncome: monthlyIncome,
        incomeDay: incomeDay,
        totalExpense: dailyExpense,
        date: DateTime.now().toString(),
      );
      _budget = b;
      await budgetBox.clear();
      await budgetBox.put(budgetKey, b);
      update();
    }
  }

  void assignBudget() {
    if (budgetBox.isNotEmpty) {
      _budget = budgetBox.get(budgetKey);
      //
      int? dif = Get.find<DateController>().getDateDifference();
      if (dif != null) {
        updateExpense(dif * _budget!.dailyExpense);
        updateDate();
      }
      update();
    }
  }

  bool isBudgetEntered() {
    if (budgetBox.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  //!Temp method
  void addAmount() {
    _budget!.budget = _budget!.budget + 100;
    budgetBox.put(budgetKey, _budget!);
    update();
  }

  void updateDate() {
    _budget!.date = DateTime.now().toString();
    budgetBox.put(budgetKey, _budget!);
    update();
  }

  void updateExpense(int newExpense) {
    _budget!.totalExpense = _budget!.totalExpense + newExpense;
    budgetBox.put(budgetKey, _budget!);
    update();
  }

  Budget? getBudget() {
    if (budgetBox.isEmpty) {
      return null;
    } else {
      return _budget;
    }
  }

  @override
  void onClose() {
    Hive.box(kBudgetBoxString).close();
    super.onClose();
  }
}

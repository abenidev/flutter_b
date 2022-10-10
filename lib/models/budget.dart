// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'budget.g.dart';

@HiveType(typeId: 1)
class Budget extends HiveObject {
  @HiveField(0)
  int budget;
  @HiveField(1)
  int dailyExpense;
  @HiveField(2)
  int monthlyIncome;
  @HiveField(3)
  int incomeDay;
  @HiveField(4)
  int totalExpense;
  @HiveField(5)
  String date;

  Budget({
    required this.budget,
    required this.dailyExpense,
    required this.monthlyIncome,
    required this.incomeDay,
    required this.totalExpense,
    required this.date,
  });

  Budget copyWith({
    int? budget,
    int? dailyExpense,
    int? monthlyIncome,
    int? incomeDay,
    int? totalExpense,
    String? date,
  }) {
    return Budget(
      budget: budget ?? this.budget,
      dailyExpense: dailyExpense ?? this.dailyExpense,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      incomeDay: incomeDay ?? this.incomeDay,
      totalExpense: totalExpense ?? this.totalExpense,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'budget': budget,
      'dailyExpense': dailyExpense,
      'monthlyIncome': monthlyIncome,
      'incomeDay': incomeDay,
      'totalExpense': totalExpense,
      'date': date,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      budget: map['budget'] as int,
      dailyExpense: map['dailyExpense'] as int,
      monthlyIncome: map['monthlyIncome'] as int,
      incomeDay: map['incomeDay'] as int,
      totalExpense: map['totalExpense'] as int,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Budget.fromJson(String source) => Budget.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Budget(budget: $budget, dailyExpense: $dailyExpense, monthlyIncome: $monthlyIncome, incomeDay: $incomeDay, totalExpense: $totalExpense, date: $date)';
  }

  @override
  bool operator ==(covariant Budget other) {
    if (identical(this, other)) return true;

    return other.budget == budget &&
        other.dailyExpense == dailyExpense &&
        other.monthlyIncome == monthlyIncome &&
        other.incomeDay == incomeDay &&
        other.totalExpense == totalExpense &&
        other.date == date;
  }

  @override
  int get hashCode {
    return budget.hashCode ^ dailyExpense.hashCode ^ monthlyIncome.hashCode ^ incomeDay.hashCode ^ totalExpense.hashCode ^ date.hashCode;
  }
}

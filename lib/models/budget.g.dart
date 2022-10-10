// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetAdapter extends TypeAdapter<Budget> {
  @override
  final int typeId = 1;

  @override
  Budget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Budget(
      budget: fields[0] as int,
      dailyExpense: fields[1] as int,
      monthlyIncome: fields[2] as int,
      incomeDay: fields[3] as int,
      totalExpense: fields[4] as int,
      date: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Budget obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.budget)
      ..writeByte(1)
      ..write(obj.dailyExpense)
      ..writeByte(2)
      ..write(obj.monthlyIncome)
      ..writeByte(3)
      ..write(obj.incomeDay)
      ..writeByte(4)
      ..write(obj.totalExpense)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

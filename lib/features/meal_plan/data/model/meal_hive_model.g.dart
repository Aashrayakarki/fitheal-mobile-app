// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MealHiveModelAdapter extends TypeAdapter<MealHiveModel> {
  @override
  final int typeId = 2;

  @override
  MealHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MealHiveModel(
      mealId: fields[0] as String?,
      mealName: fields[1] as String,
      mealTime: fields[2] as String,
      mealCalories: fields[3] as String,
      mealProteins: fields[4] as String,
      mealCarbs: fields[5] as String,
      mealImage: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MealHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.mealId)
      ..writeByte(1)
      ..write(obj.mealName)
      ..writeByte(2)
      ..write(obj.mealTime)
      ..writeByte(3)
      ..write(obj.mealCalories)
      ..writeByte(4)
      ..write(obj.mealProteins)
      ..writeByte(5)
      ..write(obj.mealCarbs)
      ..writeByte(6)
      ..write(obj.mealImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

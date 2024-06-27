// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseHiveModelAdapter extends TypeAdapter<ExerciseHiveModel> {
  @override
  final int typeId = 1;

  @override
  ExerciseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseHiveModel(
      exerciseId: fields[0] as String?,
      exerciseName: fields[1] as String,
      exerciseTime: fields[2] as String,
      exerciseCalories: fields[3] as String,
      exerciseLevel: fields[4] as String,
      exerciseVideo: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.exerciseId)
      ..writeByte(1)
      ..write(obj.exerciseName)
      ..writeByte(2)
      ..write(obj.exerciseTime)
      ..writeByte(3)
      ..write(obj.exerciseCalories)
      ..writeByte(4)
      ..write(obj.exerciseLevel)
      ..writeByte(5)
      ..write(obj.exerciseVideo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

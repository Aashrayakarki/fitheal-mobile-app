import 'dart:math';

import 'package:final_assignment/app/constants/hive_table_constant.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'exercise_hive_model.g.dart';

final exerciseHiveModelProvider = Provider(
  (ref) => ExerciseHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.exerciseTableId)
class ExerciseHiveModel {

  @HiveField(0)
  final String exerciseId;

  @HiveField(1)
  final String exerciseName;

  @HiveField(2)
  final String exerciseTime;

  @HiveField(3)
  final String exerciseCalories;

  @HiveField(4)
  final String exerciseLevel;

  @HiveField(5)
  final String exerciseVideo;

  // empty constructor
  ExerciseHiveModel.empty() : this(exerciseId: '', exerciseName: '', exerciseTime: '', exerciseCalories: '', exerciseLevel: '', exerciseVideo: '');

  ExerciseHiveModel({
    String? exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
    required this.exerciseVideo,

  }) 
  : exerciseId = exerciseId ?? const Uuid().v4();

  ExerciseEntity toEntity() {
    return ExerciseEntity(
      exerciseId: exerciseId,
      exerciseName: exerciseName,
      exerciseTime: exerciseTime,
      exerciseCalories: exerciseCalories,
      exerciseLevel: exerciseLevel,
      exerciseVideo: exerciseVideo,
    );
  }

  ExerciseHiveModel fromEntity(ExerciseEntity entity) {
    return ExerciseHiveModel(
      exerciseId: entity.exerciseId,
      exerciseName: entity.exerciseName,
      exerciseTime: entity.exerciseTime,
      exerciseCalories: entity.exerciseCalories,
      exerciseLevel: entity.exerciseLevel,
      exerciseVideo: entity.exerciseVideo,);
  }

  List<ExerciseEntity> toEntityList(List<ExerciseHiveModel> hiveModels) {
    return hiveModels.map((hiveModel) => hiveModel.toEntity()).toList();
  }

  // to hive model
  List<ExerciseHiveModel> fromEntityList(List<ExerciseEntity> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }

  @override
  String toString() {
    return 'exerciseId: $exerciseId, exerciseName: $exerciseName, exerciseTime: $exerciseTime, exerciseCalories: $exerciseCalories, exerciseLevel: $exerciseLevel, exerciseVideo: $exerciseVideo';
  }
}

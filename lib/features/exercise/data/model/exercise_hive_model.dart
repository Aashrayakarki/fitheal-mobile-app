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
  final String exerciseReps;

  @HiveField(6)
  final String exerciseSets;

  @HiveField(7)
  final String exerciseDescription;

  @HiveField(8)
  final String exerciseInstruction;

  @HiveField(9)
  final String exerciseThumbnail;

  @HiveField(10)
  final String exerciseVideo;

  // empty constructor
  ExerciseHiveModel.empty()
      : this(
            exerciseId: '',
            exerciseName: '',
            exerciseTime: '',
            exerciseCalories: '',
            exerciseLevel: '',
            exerciseReps: '',
            exerciseSets: '',
            exerciseDescription: '',
            exerciseInstruction: '',
            exerciseThumbnail: '',
            exerciseVideo: '');
            

  ExerciseHiveModel({
    String? exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
    required this.exerciseReps,
    required this.exerciseSets,
    required this.exerciseDescription,
    required this.exerciseInstruction,
    required this.exerciseThumbnail,
    required this.exerciseVideo,
  }) : exerciseId = exerciseId ?? const Uuid().v4();

  ExerciseEntity toEntity() {
    return ExerciseEntity(
      exerciseId: exerciseId,
      exerciseName: exerciseName,
      exerciseTime: exerciseTime,
      exerciseCalories: exerciseCalories,
      exerciseLevel: exerciseLevel,
      exerciseReps: exerciseReps,
      exerciseSets: exerciseSets,
      exerciseDescription: exerciseDescription,
      exerciseInstruction: exerciseInstruction,
      exerciseThumbnail: exerciseThumbnail,
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
      exerciseReps: entity.exerciseReps,
      exerciseSets: entity.exerciseSets,
      exerciseDescription: entity.exerciseDescription,
      exerciseInstruction: entity.exerciseInstruction,
      exerciseThumbnail: entity.exerciseThumbnail,
      exerciseVideo: entity.exerciseVideo,
    );
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
    return 'exerciseId: $exerciseId, exerciseName: $exerciseName, exerciseTime: $exerciseTime, exerciseCalories: $exerciseCalories, exerciseLevel: $exerciseLevel, exerciseReps: $exerciseReps, exerciseSets: $exerciseSets, exerciseDescription: $exerciseDescription, exerciseInstruction: $exerciseInstruction, exerciseThumbnail: $exerciseThumbnail, exerciseVideo: $exerciseVideo';
  }
}

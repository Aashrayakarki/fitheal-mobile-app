import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

final exerciseApiModelProvider = Provider<ExerciseApiModel>((ref) {
  return ExerciseApiModel.empty();
});

@JsonSerializable()
class ExerciseApiModel {
  @JsonKey(name: '_id')
  final String? exerciseId;
  final String exerciseName;
  final String exerciseTime;
  final String exerciseCalories;
  final String exerciseLevel;
  final String exerciseReps;
  final String exerciseSets;
  final String exerciseDescription;
  final String exerciseInstruction;
  final String exerciseThumbnail;
  final String exerciseVideo;

  ExerciseApiModel({
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
    required this.exerciseReps,
    required this.exerciseSets,
    required this.exerciseDescription,
    required this.exerciseInstruction,
    required this.exerciseThumbnail,
    required this.exerciseVideo
  });

  // Empty constructor
  ExerciseApiModel.empty()
      : exerciseId = '',
        exerciseName = '',
        exerciseTime = '',
        exerciseCalories = '',
        exerciseLevel = '',
        exerciseReps = '',
        exerciseSets = '',
        exerciseDescription = '',
        exerciseInstruction = '',
        exerciseThumbnail = '',
        exerciseVideo = '';

  factory ExerciseApiModel.fromJson(Map<String, dynamic> json) {
    return ExerciseApiModel(
      exerciseId: json['_id'],
      exerciseName: json['exerciseName'],
      exerciseTime: json['exerciseTime'],
      exerciseCalories: json['exerciseCalories'],
      exerciseLevel: json['exerciseLevel'],
      exerciseReps: json['exerciseReps'],
      exerciseSets: json['exerciseSets'],
      exerciseDescription: json['exerciseDescription'],
      exerciseInstruction: json['exerciseInstruction'],
      exerciseThumbnail: json['exerciseThumbnail'],
      exerciseVideo: json['exerciseVideo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'exerciseTime': exerciseTime,
      'exerciseCalories': exerciseCalories,
      'exerciseLevel': exerciseLevel,
      'exerciseReps': exerciseReps,
      'exerciseSets': exerciseSets,
      'exerciseDescription': exerciseDescription,
      'exerciseInstruction': exerciseInstruction,
      'exerciseThumbnail': exerciseThumbnail,
      'exerciseVideo': exerciseVideo,
    };
  }

  // Convert API Object to Entity
  ExerciseEntity toEntity() => ExerciseEntity(
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

  // Convert Entity to API Object
  ExerciseApiModel fromEntity(ExerciseEntity entity) => ExerciseApiModel(
        exerciseId: entity.exerciseId ?? '',
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

  // Convert API List to Entity List
  List<ExerciseEntity> toEntityList(List<ExerciseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}

import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

final exerciseApiModelProvider = Provider<ExerciseApiModel>((ref) {
  return ExerciseApiModel.empty();
});

@JsonSerializable()
class ExerciseApiModel {
  @JsonKey(name: '_id')
  final String exerciseId;
  final String exerciseName;
  final num exerciseTime;
  final num exerciseCalories;
  final String exerciseLevel;
  final String exerciseVideo;

  ExerciseApiModel({
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
    required this.exerciseVideo,
  });

  // Empty constructor
  ExerciseApiModel.empty()
      : exerciseId = '',
      exerciseName = '',
        exerciseTime = 0,
        exerciseCalories = 0,
        exerciseLevel = '',
        exerciseVideo = '';

  factory ExerciseApiModel.fromJson(Map<String, dynamic> json) {
    return ExerciseApiModel(
      exerciseId: json['_id'],
      exerciseName: json['exerciseName'],
      exerciseTime: json['exerciseTime'],
      exerciseCalories: json['exerciseCalories'],
      exerciseLevel: json['exerciseLevel'],
      exerciseVideo: json['exerciseVideo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'exerciseTime': exerciseTime,
      'exerciseCalories': exerciseCalories,
      'exerciseLevel': exerciseLevel,
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
        exerciseVideo: exerciseVideo,
      );

  // Convert Entity to API Object
  ExerciseApiModel fromEntity(ExerciseEntity entity) => ExerciseApiModel(
        exerciseId: entity.exerciseId,
        exerciseName: entity.exerciseName,
        exerciseTime: entity.exerciseTime,
        exerciseCalories: entity.exerciseCalories,
        exerciseLevel: entity.exerciseLevel,
        exerciseVideo: entity.exerciseVideo,
      );

  // Convert API List to Entity List
  List<ExerciseEntity> toEntityList(List<ExerciseApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}

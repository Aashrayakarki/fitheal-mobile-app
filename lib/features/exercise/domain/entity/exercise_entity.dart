import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String? exerciseId;
  final String exerciseName;
  final String exerciseTime;
  final String exerciseCalories;
  final String exerciseLevel;
  final String exerciseSets;
  final String exerciseReps;
  final String exerciseDescription;
  final String exerciseInstruction;
  final String exerciseThumbnail;
  final String exerciseVideo;

  const ExerciseEntity({
    this.exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
    required this.exerciseSets,
    required this.exerciseReps,
    required this.exerciseDescription,
    required this.exerciseInstruction,
    required this.exerciseThumbnail,
    required this.exerciseVideo,
  });

  @override
  List<Object?> get props => [
        exerciseId,
        exerciseName,
        exerciseTime,
        exerciseCalories,
        exerciseLevel,
        exerciseSets,
        exerciseReps,
        exerciseDescription,
        exerciseInstruction,
        exerciseThumbnail,
        exerciseVideo
      ];
}

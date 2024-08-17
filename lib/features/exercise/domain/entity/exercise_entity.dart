import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String? exerciseId;
  final String exerciseName;
  final String exerciseTime;
  final String exerciseCalories;
  final String exerciseLevel;
  final String exerciseThumbnail;
  final String exerciseVideo;

  const ExerciseEntity({
    this.exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
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
        exerciseThumbnail,
        exerciseVideo
      ];
}

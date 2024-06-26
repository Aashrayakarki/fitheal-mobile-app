import 'package:equatable/equatable.dart';

class ExerciseEntity extends Equatable {
  final String exerciseId;
  final String exerciseName;
  final num exerciseTime;
  final num exerciseCalories;
  final String exerciseLevel;
  final String exerciseVideo;

  const ExerciseEntity({
    required this.exerciseId,
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseCalories,
    required this.exerciseLevel,
    required this.exerciseVideo,
  });

  @override
  List<Object?> get props => [exerciseId, exerciseName, exerciseTime, exerciseCalories, exerciseLevel, exerciseVideo];
}

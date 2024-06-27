
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';

class ExerciseState {
  final bool isLoading;
  final String? error;
  final List<ExerciseEntity> lstExercises;

  const ExerciseState({
    required this.isLoading,
    required this.error,
    required this.lstExercises,
  });

  factory ExerciseState.initial() => const ExerciseState(
        isLoading: false,
        error: null,
        lstExercises: [],
      );

  ExerciseState copyWith({
    bool? isLoading,
    String? error,
    List<ExerciseEntity>? exercises,
  }) {
    return ExerciseState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      lstExercises: exercises ?? lstExercises,
    );
  }
}

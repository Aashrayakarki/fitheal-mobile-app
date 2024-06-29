import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';

class ExerciseState {
  final bool isLoading;
  final String? error;
  final int page;
  final bool hasReachedMax;
  final List<ExerciseEntity> lstExercises;

  const ExerciseState({
    required this.isLoading,
    required this.error,
    required this.page,
    required this.hasReachedMax,
    required this.lstExercises,
  });

  factory ExerciseState.initial() => const ExerciseState(
        isLoading: false,
        error: null,
        page: 0,
        hasReachedMax: false,
        lstExercises: [],
      );

  ExerciseState copyWith({
    bool? isLoading,
    String? error,
    int? page,
    bool? hasReachedMax,
    List<ExerciseEntity>? exercises,
  }) {
    return ExerciseState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      lstExercises: exercises ?? lstExercises,
    );
  }
}

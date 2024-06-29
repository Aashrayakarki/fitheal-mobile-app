import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/usecases/exercise_usecase.dart';
import 'package:final_assignment/features/exercise/presentation/state/exercise_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseViewModelProvider =
    StateNotifierProvider<ExerciseViewModel, ExerciseState>(
  (ref) => ExerciseViewModel(
    ref.read(exerciseUseCaseProvider),
  ),
);

class ExerciseViewModel extends StateNotifier<ExerciseState> {
  final ExerciseUseCase exerciseUseCase;

  ExerciseViewModel(this.exerciseUseCase) : super(ExerciseState.initial()) {
    getAllExercises();
  }

  deleteExercise(ExerciseEntity exercise) async {
    state = state.copyWith(isLoading: true);
    var data = await exerciseUseCase.deleteExercise(exercise.exerciseId!);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state.lstExercises.remove(exercise);
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(
          message: 'Course delete successfully',
        );
      },
    );

    getAllExercises();
  }

  addExercise(ExerciseEntity exercise) async {
    state = state.copyWith(isLoading: true);
    var data = await exerciseUseCase.addExercise(exercise);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: 'Exercise added successfully');
      },
    );

    getAllExercises();
  }

  getAllExercises() async {
    state = state.copyWith(isLoading: true);
    var data = await exerciseUseCase.getAllExercises();

    data.fold((l) {
      state = state.copyWith(isLoading: false, error: l.error);
      showMySnackBar(message: l.error, color: Colors.red);
    }, (r) {
      state = state.copyWith(isLoading: false, exercises: r);
    });
  }
}

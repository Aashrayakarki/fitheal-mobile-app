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

Future resetState() async {
    state = ExerciseState.initial();
    getAllExercises();
  }

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
    final currentState = state;
    final page = currentState.page + 1;
    final lstExercises = currentState.lstExercises;
    final hasReachedMax = currentState.hasReachedMax;

    if (!hasReachedMax) {
      var data = await exerciseUseCase.getAllExercises(page);

      data.fold((l) {
        state = state.copyWith(
            hasReachedMax: true, isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      }, (r) {
        if (r.isEmpty) {
          state = state.copyWith(hasReachedMax: true, isLoading: false);
        } else {
          state = state.copyWith(
              isLoading: false, exercises: [...lstExercises, ...r], page: page);
        }
      });
    }
    if (hasReachedMax) {
      state = state.copyWith(isLoading: false);
    }
  }
}
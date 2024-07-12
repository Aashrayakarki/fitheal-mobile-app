import 'package:final_assignment/core/common/my_snackbar.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/usecases/meal_usecase.dart';
import 'package:final_assignment/features/meal_plan/presentation/state/meal_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealViewModelProvider = StateNotifierProvider<MealViewModel, MealState>(
  (ref) => MealViewModel(
    ref.read(mealUseCaseProvider),
  ),
);

class MealViewModel extends StateNotifier<MealState> {
  final MealUsecase mealUseCase;

  Future resetState() async {
    state = MealState.initial();
    getAllMeals();
  }

  MealViewModel(this.mealUseCase) : super(MealState.initial()) {
    getAllMeals();
  }

  deleteMeal(MealEntity meal) async {
    state = state.copyWith(isLoading: true);
    var data = await mealUseCase.deleteMeal(meal.mealId!);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state.lstMeals.remove(meal);
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(
          message: 'Meal deleted successfully',
        );
      },
    );

    getAllMeals();
  }

  addMeal(MealEntity meal) async {
    state = state.copyWith(isLoading: true);
    var data = await mealUseCase.addMeal(meal);

    data.fold(
      (l) {
        state = state.copyWith(isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      },
      (r) {
        state = state.copyWith(isLoading: false, error: null);
        showMySnackBar(message: 'Meal added successfully');
      },
    );

    getAllMeals();
  }

  getAllMeals() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final page = currentState.page + 1;
    final lstMeals = currentState.lstMeals;
    final hasReachedMax = currentState.hasReachedMax;

    if (!hasReachedMax) {
      var data = await mealUseCase.getAllMeals(page);

      data.fold((l) {
        state = state.copyWith(
            hasReachedMax: true, isLoading: false, error: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      }, (r) {
        if (r.isEmpty) {
          state = state.copyWith(hasReachedMax: true, isLoading: false);
        } else {
          state = state.copyWith(
              isLoading: false, meals: [...lstMeals, ...r], page: page);
        }
      });
    }
    if (hasReachedMax) {
      state = state.copyWith(isLoading: false);
    }
  }
}

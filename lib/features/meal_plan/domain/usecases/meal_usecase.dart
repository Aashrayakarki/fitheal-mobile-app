import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/repository/exercise_repository.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/repository/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealUseCaseProvider = Provider<MealUseCase>(
  (ref) => MealUseCase(
    mealRepository: ref.read(mealRepositoryProvider),
  ),
);

class MealUsecase {
  final IMealRepository mealRepository;

  MealUsecase({required this.mealRepository});

  Future<Either<Failure, bool>> addMeal(MealEntity meal) {
    return mealRepository.addMeal(meal);
  }

  Future<Either<Failure, List<MealEntity>>> getAllMeals(int? page) {
    return mealRepository.getAllMeals(page!);
  }

  Future<Either<Failure, bool>> deleteMeal(String id) async {
    return mealRepository.deleteMeal(id);
  }

}

import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/local/hive_service.dart';
import 'package:final_assignment/features/meal_plan/data/model/meal_hive_model.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealLocalDataSourceProvider = Provider<MealLocalDataSource>(
  (ref) => MealLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    mealHiveModel: ref.read(mealHiveModelProvider),
  ),
);

class MealLocalDataSource {
  final HiveService hiveService;
  final MealHiveModel mealHiveModel;

  MealLocalDataSource({
    required this.hiveService,
    required this.mealHiveModel,
  });
  // Add Meal
  Future<Either<Failure, bool>> addMeal(MealEntity meal) async {
    try {
      // Convert Entity to Hive Object
      final hiveMeal = mealHiveModel.fromEntity(meal);
      // Add to Hive
      await hiveService.addMeal(hiveMeal);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Meals
  Future<Either<Failure, List<MealEntity>>> getAllMeals(page) async {
    try {
      // Get from Hive
      final hiveMeals = await hiveService.getAllMeals(page);
      // Convert Hive Object to Entity
      final meals = mealHiveModel.toEntityList(hiveMeals);
      return Right(meals);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}

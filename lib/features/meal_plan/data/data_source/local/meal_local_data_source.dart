import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/local/hive_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealLocalDataSourceProvider = Provider<MealLocalDataSource>(
  (ref) => MealLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    mealHiveModel: ref.read(mealHiveModelProvider),
  ),
);

class ExerciseLocalDataSource {
  final HiveService hiveService;
  final MealHiveModel mealHiveModel;

  ExerciseLocalDataSource({
    required this.hiveService,
    required this.mealHiveModel,
  });
  // Add Meal
  Future<Either<Failure, bool>> addExercise(MealEntity meal) async {
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
  Future<Either<Failure, List<MealEntity>>> getAllMeals() async {
    try {
      // Get from Hive
      final hiveMeals = await hiveService.getAllMeals();
      // Convert Hive Object to Entity
      final meals = mealHiveModel.toEntityList(hiveMeals);
      return Right(meals);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}

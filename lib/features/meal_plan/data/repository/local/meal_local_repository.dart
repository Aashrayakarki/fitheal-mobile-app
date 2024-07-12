import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/data/data_source/local/exercise_local_data_source.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/repository/exercise_repository.dart';
import 'package:final_assignment/features/meal_plan/data/data_source/local/meal_local_data_source.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/repository/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealLocalRepositoryProvider = Provider<IMealRepository>(
  (ref) => MealLocalRepositoryImpl(
    mealLocalDataSource: ref.read(mealLocalDataSourceProvider),
  ),
);

class MealLocalRepositoryImpl implements IMealRepository {
  final MealLocalDataSource mealLocalDataSource;

  MealLocalRepositoryImpl({required this.mealLocalDataSource});

  @override
  Future<Either<Failure, bool>> addMeal(MealEntity meal) {
    return mealLocalDataSource.addMeal(meal);
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getAllMeals(page) {
    return mealLocalDataSource.getAllMeals(page);
  }

  @override
  Future<Either<Failure, bool>> deleteMeal(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }
}

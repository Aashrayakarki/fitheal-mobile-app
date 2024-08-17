import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/meal_plan/data/data_source/remote/meal_remote_data_source.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/repository/meal_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealRemoteRepositoryProvider = Provider<IMealRepository>(
  (ref) => MealRemoteRepository(
    mealRemoteDataSource: ref.read(mealRemoteDataSourceProvider),
  ),
);

class MealRemoteRepository implements IMealRepository {
  final MealRemoteDataSource mealRemoteDataSource;

  MealRemoteRepository({required this.mealRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addMeal(MealEntity meal) {
    return mealRemoteDataSource.addMeal(meal);
  }

  @override
  Future<Either<Failure, bool>> deleteMeal(String id) {
    return mealRemoteDataSource.deleteMeal(id);
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getAllMeals(page) {
    return mealRemoteDataSource.getAllMeals(page);
  }
}

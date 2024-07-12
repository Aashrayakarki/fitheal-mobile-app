import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/common/provider/internet_connectivity.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/meal_plan/data/repository/local/meal_local_repository.dart';
import 'package:final_assignment/features/meal_plan/data/repository/remote/meal_remote_repository.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealRepositoryProvider = Provider<IMealRepository>(
  (ref) {
    final checkConnectivity = ref.read(connectivityStatusProvider);

    if (checkConnectivity == ConnectivityStatus.isConnected) {
      return ref.read(mealRemoteRepositoryProvider);
    } else {
      return ref.read(mealLocalRepositoryProvider);
    }    
  },

);

abstract class IMealRepository {
  Future<Either<Failure, bool>> addMeal(MealEntity meal);
  Future<Either<Failure, List<ExerciseEntity>>> getAllMeals(page);
  Future<Either<Failure, bool>> deleteMeal(String id);
}



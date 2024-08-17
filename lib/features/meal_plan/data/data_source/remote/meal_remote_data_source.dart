import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/meal_plan/data/dto/get_all_meal_dto.dart';
import 'package:final_assignment/features/meal_plan/data/model/meal_api_model.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealRemoteDataSourceProvider = Provider<MealRemoteDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  final mealApiModel = ref.read(mealApiModelProvider);
  final userSharedPrefs = ref.read(userSharedPrefsProvider);

  return MealRemoteDataSource(
    dio: dio,
    mealApiModel: mealApiModel,
    userSharedPrefs: userSharedPrefs,
  );
});

class MealRemoteDataSource {
  final Dio dio;
  final MealApiModel mealApiModel;
  final UserSharedPrefs userSharedPrefs;

  MealRemoteDataSource({
    required this.dio,
    required this.mealApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addMeal(MealEntity meal) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createMeal,
        data: mealApiModel.fromEntity(meal).toJson(),
      );
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(Failure(error: 'Failed to add meal'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<MealEntity>>> getAllMeals(page) async {
    try {
      final response = await dio.get(
        ApiEndpoints.getAllMeals,
        queryParameters: {
          'page': page,
        },
      );

      final getAllMealDto = GetAllMealDto.fromJson(response.data);

      return Right(getAllMealDto.data.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }

  //Delete Meal

  Future<Either<Failure, bool>> deleteMeal(String mealId) async {
    try {
      // Retrieve token from shared preferences
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteExercise + mealId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}

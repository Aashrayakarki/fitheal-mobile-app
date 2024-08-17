import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_assignment/app/constants/api_endpoint.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/remote/http_service.dart';
import 'package:final_assignment/core/shared_prefs/user_shared_prefs.dart';
import 'package:final_assignment/features/exercise/data/dto/get_all_exercise_dto.dart';
import 'package:final_assignment/features/exercise/data/model/exercise_api_model.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseRemoteDataSourceProvider =
    Provider<ExerciseRemoteDataSource>((ref) {
  final dio = ref.read(httpServiceProvider);
  final exerciseApiModel = ref.read(exerciseApiModelProvider);
  final userSharedPrefs = ref.read(userSharedPrefsProvider);

  return ExerciseRemoteDataSource(
    dio: dio,
    exerciseApiModel: exerciseApiModel,
    userSharedPrefs: userSharedPrefs,
  );
});

class ExerciseRemoteDataSource {
  final Dio dio;
  final ExerciseApiModel exerciseApiModel;
  final UserSharedPrefs userSharedPrefs;

  ExerciseRemoteDataSource({
    required this.dio,
    required this.exerciseApiModel,
    required this.userSharedPrefs,
  });

  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise) async {
    try {
      var response = await dio.post(
        ApiEndpoints.createExercise,
        data: exerciseApiModel.fromEntity(exercise).toJson(),
      );
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(Failure(error: 'Failed to add exercise'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises(page) async {
    try {
      final response = await dio.get(
        ApiEndpoints.getAllExercises,
        queryParameters: {
          'page': page,
        },
      );

      final getAllExerciseDto = GetAllExerciseDto.fromJson(response.data);

      return Right(getAllExerciseDto.data.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Left(Failure(error: error.toString()));
    }
  }

  //Delete exercise

  Future<Either<Failure, bool>> deleteExercise(String exerciseId) async {
    try {
      // Retrieve token from shared preferences
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.delete(
        ApiEndpoints.deleteExercise + exerciseId,
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

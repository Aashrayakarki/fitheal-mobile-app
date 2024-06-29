import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/core/networking/local/hive_service.dart';
import 'package:final_assignment/features/exercise/data/model/exercise_hive_model.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseLocalDataSourceProvider = Provider<ExerciseLocalDataSource>(
  (ref) => ExerciseLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    exerciseHiveModel: ref.read(exerciseHiveModelProvider),
  ),
);

class ExerciseLocalDataSource {
  final HiveService hiveService;
  final ExerciseHiveModel exerciseHiveModel;

  ExerciseLocalDataSource({
    required this.hiveService,
    required this.exerciseHiveModel,
  });
  // Add Exercise
  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise) async {
    try {
      // Convert Entity to Hive Object
      final hiveExercise = exerciseHiveModel.fromEntity(exercise);
      // Add to Hive
      await hiveService.addExercise(hiveExercise);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Exercises
  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises(int page) async {
    try {
      // Get from Hive
      final hiveExercises = await hiveService.getAllExercises(page);
      // Convert Hive Object to Entity
      final exercises = exerciseHiveModel.toEntityList(hiveExercises);
      return Right(exercises);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}

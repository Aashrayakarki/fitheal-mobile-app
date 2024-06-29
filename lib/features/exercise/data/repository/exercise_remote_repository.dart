import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/data/data_source/remote/exercise_remote_data_source.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/repository/exercise_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseRemoteRepositoryProvider = Provider<IExerciseRepository>(
  (ref) => ExerciseRemoteRepository(
    exerciseRemoteDataSource: ref.read(exerciseRemoteDataSourceProvider),
  ),
);

class ExerciseRemoteRepository implements IExerciseRepository {
  final ExerciseRemoteDataSource exerciseRemoteDataSource;

  ExerciseRemoteRepository({required this.exerciseRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise) {
    return exerciseRemoteDataSource.addExercise(exercise);
  }

  @override
  Future<Either<Failure, bool>> deleteExercise(String id) {
    return exerciseRemoteDataSource.deleteExercise(id);
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises(page) {
    return exerciseRemoteDataSource.getAllExercises(page);
  }
}

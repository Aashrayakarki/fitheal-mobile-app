import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/data/data_source/local/exercise_local_data_source.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/repository/exercise_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseLocalRepositoryProvider = Provider<IExerciseRepository>(
  (ref) => ExerciseLocalRepositoryImpl(
    exerciseLocalDataSource: ref.read(exerciseLocalDataSourceProvider),
  ),
);

class ExerciseLocalRepositoryImpl implements IExerciseRepository {
  final ExerciseLocalDataSource exerciseLocalDataSource;

  ExerciseLocalRepositoryImpl({required this.exerciseLocalDataSource});

  @override
  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise) {
    return exerciseLocalDataSource.addExercise(exercise);
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises() {
    return exerciseLocalDataSource.getAllExercises();
  }

  @override
  Future<Either<Failure, bool>> deleteExercise(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }
}

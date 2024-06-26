import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseRepositoryProvider = Provider<IExerciseRepository>(
  (ref) => ref.read(exerciseRemoteRepositoryProvider),
);

abstract class IExerciseRepository {
  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise);
  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises();
  Future<Either<Failure, bool>> deleteExercise(String id);
}



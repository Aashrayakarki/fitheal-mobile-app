import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/exercise/domain/repository/exercise_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final courseUseCaseProvider = Provider<ExerciseUseCase>(
  (ref) => ExerciseUseCase(
    exerciseRepository: ref.read(exerciseRepositoryProvider),
  ),
);

class ExerciseUseCase {
  final IExerciseRepository exerciseRepository;

  ExerciseUseCase({required this.exerciseRepository});

  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise) {
    return exerciseRepository.addExercise(exercise);
  }

  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises() {
    return exerciseRepository.getAllExercises();
  }

  Future<Either<Failure, bool>> deleteExercise(String id) async {
    return exerciseRepository.deleteExercise(id);
  }

}

import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/common/provider/internet_connectivity.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/exercise/data/repository/exercise_local_repository.dart';
import 'package:final_assignment/features/exercise/data/repository/exercise_remote_repository.dart';
import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseRepositoryProvider = Provider<IExerciseRepository>(
  (ref) {
    final checkConnectivity = ref.read(connectivityStatusProvider);

    if (checkConnectivity == ConnectivityStatus.isConnected) {
      return ref.read(exerciseRemoteRepositoryProvider);
    } else {
      return ref.read(exerciseLocalRepositoryProvider);
    }    
  },

);

abstract class IExerciseRepository {
  Future<Either<Failure, bool>> addExercise(ExerciseEntity exercise);
  Future<Either<Failure, List<ExerciseEntity>>> getAllExercises(page);
  Future<Either<Failure, bool>> deleteExercise(String id);
}



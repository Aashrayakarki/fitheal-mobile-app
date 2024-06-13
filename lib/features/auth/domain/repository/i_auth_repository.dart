import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/auth/data/repository/auth_local_repository.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.watch(authLocalRepository);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> addStudent(AuthEntity auth);
  Future<Either<Failure, bool>> login(String username, String password);
}
import 'package:final_assignment/app/constants/hive_table_constant.dart';
import 'package:final_assignment/features/auth/data/model/auth_hive_model.dart';
import 'package:final_assignment/features/exercise/data/model/exercise_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

final hiveServiceProvider = Provider((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

  // ============= User Queries
  Future<void> addUser(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  Future<List<AuthHiveModel>> getAllUsers() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var users = box.values.toList();
    box.close();
    return users;
  }

  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere((element) =>
        element.email == email && element.password == password);
    box.close();
    return user;
  }
}

// ======================== Exercise Queries ========================
  Future<void> addExercise(ExerciseHiveModel exercise) async {
    var box = await Hive.openBox<ExerciseHiveModel>(HiveTableConstant.exerciseBox);
    await box.put(exercise.exerciseId, exercise);
  }

  Future<List<ExerciseHiveModel>> getAllExercises() async {
    var box = await Hive.openBox<ExerciseHiveModel>(HiveTableConstant.exerciseBox);
    var exercises = box.values.toList();
    box.close();
    return exercises;
  }

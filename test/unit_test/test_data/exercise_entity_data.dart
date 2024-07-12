import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';

class ExerciseTestData {
  ExerciseTestData._();

  static List<ExerciseEntity> getExerciseTestData() {
    List<ExerciseEntity> lstExercises = [
      const ExerciseEntity(
        exerciseId: "20df4a89-6c95-44d0-bebf-0980c33bd49f",
        exerciseName: "Pushups",
        exerciseTime: "10",
        exerciseCalories: "100",
        exerciseLevel: "Beginner",
        exerciseVideo: "https://www.youtube.com/watch?v=IODxDxX7oi4",
      ),
      const ExerciseEntity(
        exerciseId: "20df4a89-6c95-44d0-bebf-0980c33bd49f",
        exerciseName: "Pushups",
        exerciseTime: "10",
        exerciseCalories: "100",
        exerciseLevel: "Beginner",
        exerciseVideo: "https://www.youtube.com/watch?v=IODxDxX7oi4",
      ),
    ];

    return lstExercises;
  }
}



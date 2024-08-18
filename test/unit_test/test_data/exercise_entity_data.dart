import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';

class ExerciseTestData {
  ExerciseTestData._();

  static List<ExerciseEntity> getExerciseTestData() {
    List<ExerciseEntity> lstExercises = [
      const ExerciseEntity(
        exerciseId: "20df4a89-6c95-44d0-bebf-0980c33bd49f",
        exerciseName: "Pushups",
        exerciseTime: "10",
        exerciseCalories: "300",
        exerciseLevel: "Beginner",
        exerciseReps: "10",
        exerciseSets: "3",
        exerciseDescription: "Pushups are a fast and effective exercise for building strength. They can be done from virtually anywhere and don't require any equipment.",
        exerciseInstruction: "pushups_instruction.png",
        exerciseThumbnail: "pushups_thumbnail.png",
        exerciseVideo: "abc.mp4"
      ),
      const ExerciseEntity(
        exerciseId: "21df4a89-6c95-44d0-bebf-0980c33bd49f",
        exerciseName: "Burpees",
        exerciseTime: "12",
        exerciseCalories: "400",
        exerciseLevel: "Amateur",
        exerciseReps: "12",
        exerciseSets: "3",
        exerciseDescription: "Burpees are a full body exercise that can be done from virtually anywhere. They are a great way to improve your cardiovascular fitness and muscle strength.",
        exerciseInstruction: "burpees_instruction.png",
        exerciseThumbnail: "burpees_thumbnail.png",
        exerciseVideo: "abc.mp4"
      ),
    ];

    return lstExercises;
  }
}

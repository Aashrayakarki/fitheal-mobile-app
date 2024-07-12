import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';

class MealTestData {
  MealTestData._();

  static List<MealEntity> getMealTestData() {
    List<MealEntity> lstMeals = [
      const MealEntity(
        mealId: "20df4a89-6c95-44d0-bebf-0980c33bd49f",
        mealName: "Garlic Chicken",
        mealTime: "30",
        mealCalories: "100",
        mealProteins: "160",
        mealCarbs: "200",
        mealImage: "abc.png",
      ),
      const MealEntity(
        mealId: "20df4a89-6c95-44d0-bebf-0980c33bd49f",
        mealName: "Garlic Chicken",
        mealTime: "30",
        mealCalories: "100",
        mealProteins: "160",
        mealCarbs: "200",
        mealImage: "abc.png",
      ),
    ];

    return lstMeals;
  }
}



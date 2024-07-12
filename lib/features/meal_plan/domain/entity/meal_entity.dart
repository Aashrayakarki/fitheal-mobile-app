import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String? mealId;
  final String mealName;
  final String mealTime;
  final String mealCalories;
  final String mealProteins;
  final String mealCarbs;
  final String mealImage;

  const MealEntity({
    this.mealId,
    required this.mealName,
    required this.mealTime,
    required this.mealCalories,
    required this.mealProteins,
    required this.mealCarbs,
    required this.mealImage,
  });

  @override
  List<Object?> get props => [mealId, mealName, mealTime, mealCalories, mealProteins, mealCarbs, mealImage];
}

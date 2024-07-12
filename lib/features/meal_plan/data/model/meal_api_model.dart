import 'package:final_assignment/features/exercise/domain/entity/exercise_entity.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

final mealApiModelProvider = Provider<MealApiModel>((ref) {
  return MealApiModel.empty();
});

@JsonSerializable()
class MealApiModel {
  @JsonKey(name: '_id')
  final String? mealId;
  final String mealName;
  final String mealTime;
  final String mealCalories;
  final String mealProteins;
  final String mealCarbs;
  final String mealImage;

  MealApiModel({
    required this.mealId,
    required this.mealName,
    required this.mealTime,
    required this.mealCalories,
    required this.mealProteins,
    required this.mealCarbs,
    required this.mealImage,
  });

  // Empty constructor
  MealApiModel.empty()
      : mealId = '',
        mealName = '',
        mealTime = '',
        mealCalories = '',
        mealProteins = '',
        mealCarbs = '',
        mealImage = '';
        

  factory MealApiModel.fromJson(Map<String, dynamic> json) {
    return MealApiModel(
      mealId: json['_id'],
      mealName: json['mealName'],
      mealTime: json['mealTime'],
      mealCalories: json['mealCalories'],
      mealProteins: json['mealProteins'],
      mealCarbs: json['mealCarbs'],
      mealImage: json['mealImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mealName': mealName,
      'mealTime': mealTime,
      'mealCalories': mealCalories,
      'mealProteins': mealProteins,
      'mealCarbs': mealCarbs,
      'mealImage': mealImage,
    };
  }

  // Convert API Object to Entity
  MealEntity toEntity() => MealEntity(
        mealId: mealId,
        mealName: mealName,
        mealTime: mealTime,
        mealCalories: mealCalories,
        mealProteins: mealProteins,
        mealCarbs: mealCarbs,
        mealImage: mealImage,
      );

  // Convert Entity to API Object
  MealApiModel fromEntity(MealEntity entity) => MealApiModel(
        mealId: entity.mealId ?? '',
        mealName: entity.mealName,
        mealTime: entity.mealTime,
        mealCalories: entity.mealCalories,
        mealProteins: entity.mealProteins,
        mealCarbs: entity.mealCarbs,
        mealImage: entity.mealImage,
      );

  // Convert API List to Entity List
  List<MealEntity> toEntityList(List<MealApiModel> models) =>
      models.map((model) => model.toEntity()).toList();
}

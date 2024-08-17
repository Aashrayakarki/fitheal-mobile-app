import 'package:final_assignment/app/constants/hive_table_constant.dart';
import 'package:final_assignment/features/meal_plan/domain/entity/meal_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'meal_hive_model.g.dart';

final mealHiveModelProvider = Provider(
  (ref) => MealHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.mealTableId)
class MealHiveModel {
  @HiveField(0)
  final String mealId;

  @HiveField(1)
  final String mealName;

  @HiveField(2)
  final String mealDescription;

  @HiveField(3)
  final String mealTime;

  @HiveField(4)
  final String mealCalories;

  @HiveField(5)
  final String mealProteins;

  @HiveField(6)
  final String mealCarbs;

  @HiveField(7)
  final String mealImage;

  // empty constructor
  MealHiveModel.empty()
      : this(
            mealId: '',
            mealName: '',
            mealDescription: '',
            mealTime: '',
            mealCalories: '',
            mealProteins: '',
            mealCarbs: '',
            mealImage: '');

  MealHiveModel({
    String? mealId,
    required this.mealName,
    required this.mealDescription,
    required this.mealTime,
    required this.mealCalories,
    required this.mealProteins,
    required this.mealCarbs,
    required this.mealImage,
  }) : mealId = mealId ?? const Uuid().v4();

  MealEntity toEntity() {
    return MealEntity(
      mealId: mealId,
      mealName: mealName,
      mealDescription: mealDescription,
      mealTime: mealTime,
      mealCalories: mealCalories,
      mealProteins: mealProteins,
      mealCarbs: mealCarbs,
      mealImage: mealImage,
    );
  }

  MealHiveModel fromEntity(MealEntity entity) {
    return MealHiveModel(
      mealId: entity.mealId,
      mealName: entity.mealName,
      mealDescription: entity.mealDescription,
      mealTime: entity.mealTime,
      mealCalories: entity.mealCalories,
      mealProteins: entity.mealProteins,
      mealCarbs: entity.mealCarbs,
      mealImage: entity.mealImage,
    );
  }

  List<MealEntity> toEntityList(List<MealHiveModel> hiveModels) {
    return hiveModels.map((hiveModel) => hiveModel.toEntity()).toList();
  }

  // to hive model
  List<MealHiveModel> fromEntityList(List<MealEntity> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }

  @override
  String toString() {
    return 'mealId: $mealId, mealName: $mealName, mealDescription: $mealDescription, mealTime: $mealTime, mealCalories: $mealCalories, mealProteins: $mealProteins, mealCarbs: $mealCarbs, mealImage: $mealImage';
  }
}

import 'package:final_assignment/features/meal_plan/data/model/meal_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_meal_dto.g.dart';

@JsonSerializable()
class GetAllMealDto {
  final bool success;
  final String message;
  final List<MealApiModel> data;

  GetAllMealDto({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllMealDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllMealDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllMealDtoToJson(this);
}

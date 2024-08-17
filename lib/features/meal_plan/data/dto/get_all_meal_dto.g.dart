// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMealDto _$GetAllMealDtoFromJson(Map<String, dynamic> json) =>
    GetAllMealDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => MealApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllMealDtoToJson(GetAllMealDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

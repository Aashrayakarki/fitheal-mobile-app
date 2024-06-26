// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllExerciseDto _$GetAllExerciseDtoFromJson(Map<String, dynamic> json) =>
    GetAllExerciseDto(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ExerciseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllExerciseDtoToJson(GetAllExerciseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };

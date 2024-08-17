// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_exercise_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllExerciseDto _$GetAllExerciseDtoFromJson(Map<String, dynamic> json) =>
    GetAllExerciseDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ExerciseApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllExerciseDtoToJson(GetAllExerciseDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

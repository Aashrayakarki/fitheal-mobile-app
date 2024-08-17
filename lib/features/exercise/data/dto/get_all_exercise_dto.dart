import 'package:final_assignment/features/exercise/data/model/exercise_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_exercise_dto.g.dart';

@JsonSerializable()
class GetAllExerciseDto {
  final bool success;
  final String message;
  final List<ExerciseApiModel> data;

  GetAllExerciseDto({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllExerciseDto.fromJson(Map<String, dynamic> json) =>
      _$GetAllExerciseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllExerciseDtoToJson(this);
}

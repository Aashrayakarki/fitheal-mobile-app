import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name: "_id")
  final String id;
  final String fname;
  final String lname;
  final String phone;
  final String email;
  final String height;
  final String weight;
  final String age;
  final String gender;

  GetCurrentUserDto({
    required this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender
  });

  AuthEntity toEntity() {
    return AuthEntity(
      id: id,
      fname: fname,
      lname: lname,
      phone: phone,
      email: email,
      password: '',
      height: height,
      weight: weight,
      age: age,
      gender: gender
    );
  }

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}

import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name: "_id")
  final String id;
  final String fname;
  final String lname;
  final String phone; // Ensure this is a String
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
      GetCurrentUserDto(
        id: json['_id'] as String,
        fname: json['fname'] as String,
        lname: json['lname'] as String,
        phone: json['phone']?.toString() ?? '', // Convert phone to String
        email: json['email'] as String,
        height: json['height'] as String,
        weight: json['weight'] as String,
        age: json['age'] as String,
        gender: json['gender'] as String,
      );

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}

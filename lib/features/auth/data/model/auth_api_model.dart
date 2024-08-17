import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String id;
  final String fname;
  final String lname;
  final String phone;
  final String email;
  final String? password;
  final String height;
  final String weight;
  final String age;
  final String gender;

  AuthApiModel(
      {required this.id,
      required this.fname,
      required this.lname,
      required this.phone,
      required this.email,
      required this.password,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender});

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
        id: id,
        fname: fname,
        lname: lname,
        phone: phone,
        email: email,
        password: password ?? '',
        height: height,
        weight: weight,
        age: age,
        gender: gender);
  }
}

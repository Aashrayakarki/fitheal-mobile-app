// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentUserDto _$GetCurrentUserDtoFromJson(Map<String, dynamic> json) =>
    GetCurrentUserDto(
      id: json['_id'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$GetCurrentUserDtoToJson(GetCurrentUserDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'phone': instance.phone,
      'email': instance.email,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'gender': instance.gender,
    };

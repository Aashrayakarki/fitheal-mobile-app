// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      height: json['height'] as String,
      weight: json['weight'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fname': instance.fname,
      'lname': instance.lname,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'gender': instance.gender,
    };

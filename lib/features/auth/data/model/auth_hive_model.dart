import 'package:final_assignment/app/constants/hive_table_constant.dart';
import 'package:final_assignment/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String password;

  @HiveField(6)
  final String height;

  @HiveField(7)
  final String weight;

  @HiveField(8)
  final String age;

  @HiveField(9)
  final String gender;

  // Constructor
  AuthHiveModel(
      {String? userId,
      required this.fname,
      required this.lname,
      required this.phone,
      required this.email,
      required this.password,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender})
      : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
            userId: '',
            fname: '',
            lname: '',
            phone: '',
            email: '',
            password: '',
            height: '',
            weight: '',
            age: '',
            gender: '');

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
      id: userId,
      fname: fname,
      lname: lname,
      phone: phone,
      email: email,
      password: password,
      height: height,
      weight: weight,
      age: age,
      gender: gender);

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
      userId: const Uuid().v4(),
      fname: entity.fname,
      lname: entity.lname,
      phone: entity.phone,
      email: entity.email,
      password: entity.password,
      height: entity.height,
      weight: entity.weight,
      age: entity.age,
      gender: entity.gender);

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fname: $fname, lname: $lname, phone: $phone, email: $email, password: $password, height: $height, weight: $weight, age; $age, gender: $gender';
  }
}

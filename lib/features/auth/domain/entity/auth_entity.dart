import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final String email;
  final String password;
  final String height;
  final String weight;
  final String age;
  final String gender;

  const AuthEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.password,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender
  });

  @override
  List<Object?> get props => [id, fname, lname, phone, email, password, height, weight, age, gender];
}

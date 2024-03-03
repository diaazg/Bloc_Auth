import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? email;
  final String? password;

  const UserModel({this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [email, password];
}

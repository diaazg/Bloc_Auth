import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? email;
  final String? password;

  const UserModel({this.id, this.email, this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [id, email, password];
}

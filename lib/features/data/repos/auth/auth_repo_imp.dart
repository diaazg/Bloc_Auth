import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:prisma_app_note/core/error/failures.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/features/data/models/user_model.dart';
import 'package:prisma_app_note/features/data/repos/auth/auth_repos.dart';

class AuthRepoImp implements AuthRepo {
  final ApiService apiService;

  AuthRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<UserModel>>> fetchAll() async {
    try {
      var data = await apiService.get(endPoint: 'all');
      List<UserModel> users = [];
      List dataBody = data["body"];
      for (dynamic user in dataBody) {
        users.add(UserModel.fromJson(user));
      }
      return right(users);
    } on Exception catch (e) {
      if (e is DioException) {
        //Dio will sent u to carch when it receive status type != 200
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure("Oops there was an error , try again !"));
    }
  }

  @override
  Future<Either<Failure, String>> register(
      String email, String password) async {
    try {
      dynamic jsonData = UserModel(email: email, password: password).toJson();
      await apiService.post(endPoint: 'registration', data: jsonData);
      return right("Registration successfull");
    } on Exception catch (e) {
      if (e is DioException) {
        //Dio will sent u to carch when it receive status type != 200
        return left(Serverfailure.fromDioError(e));
      }
      return left(Serverfailure("Oops there was an error , try again !"));
    }
  }
}

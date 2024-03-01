import 'package:dartz/dartz.dart';
import 'package:prisma_app_note/core/error/failures.dart';
import 'package:prisma_app_note/core/utils/api_service.dart';
import 'package:prisma_app_note/data/models/user_model.dart';
import 'package:prisma_app_note/repos/auth/auth_repos.dart';

class AuthRepoImp implements AuthRepo {
  final ApiService apiService;

  AuthRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<UserModel>>> fetchAll() async {
    try {
      var data = await apiService.get(endPoint: 'all');
      List<UserModel> users = [];
      List dataBody = data["body"];
      for (Map<String, String> user in dataBody) {
        users.add(UserModel.fromJson(user));
      }
      return right(users);
    } on Exception catch (e) {
      return left(Serverfailure());
    }
  }

  @override
  Future<Either<Failure, String>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}

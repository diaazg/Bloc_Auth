import 'package:dartz/dartz.dart';
import 'package:prisma_app_note/core/error/failures.dart';
import 'package:prisma_app_note/repos/auth/auth_repos.dart';

class AuthRepoImp implements AuthRepo {
  @override
  Future<Either<Failure, String>> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
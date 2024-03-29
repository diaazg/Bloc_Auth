import 'package:dartz/dartz.dart';
import 'package:prisma_app_note/core/error/failures.dart';
import 'package:prisma_app_note/features/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, List<UserModel>>> fetchAll();
  Future<Either<Failure, Map>> register(String email, String password);
  Future<Either<Failure, Map>> login(String email, String password);
}

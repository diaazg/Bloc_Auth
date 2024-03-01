import 'package:dartz/dartz.dart';
import 'package:prisma_app_note/error/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, String>> register(String email, String password);
}

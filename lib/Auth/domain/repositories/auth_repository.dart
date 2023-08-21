import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class AuthRepositories {
  Future<Either<Failure, Unit>> signIn(String email, password);
  Future<Either<Failure, Unit>> signUp(String password, email);
}

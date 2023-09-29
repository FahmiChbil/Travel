import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepositories authRepositories;

  SignUpUseCase(this.authRepositories);

  Future<Either<Failure, UserCredential>> call(
      String password, email, userName) {
    return authRepositories.signUp(password, email, userName);
  }
}

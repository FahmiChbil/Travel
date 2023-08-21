import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepositories authRepositories;

  SignUpUseCase(this.authRepositories);

  Future<Either<Failure, Unit>> call(String password, email) {
    return authRepositories.signUp(password, email);
  }
}

// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepositories authRepositories;

  SignInUseCase(this.authRepositories);
  Future<Either<Failure, Unit>> call(String email, password) {
    return authRepositories.signIn(email, password);
  }
}

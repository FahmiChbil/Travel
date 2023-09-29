import 'package:dartz/dartz.dart';
import 'package:mylasttravelapp/Auth/domain/repositories/auth_repository.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';

class SignOutUseCase {
  AuthRepositories authRepositories;
  SignOutUseCase(this.authRepositories);
  Future<Either<Failure, Unit>> call() async {
    return authRepositories.signOut();
  }
}

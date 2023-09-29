import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/errors/failure.dart';

abstract class AuthRepositories {
  Future<Either<Failure, UserCredential>> signIn(String email, password);
  Future<Either<Failure, UserCredential>> signUp(
      String password, email, userName);
  Future<Either<Failure, Unit>> signOut();
}

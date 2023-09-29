// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/Exceptions/exception.dart';
import '../../../core/Network/networ_info.dart';
import '../../../core/errors/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthrepositoryImpl implements AuthRepositories {
  final ImplAuthRemoteDataSource implAuthRemoteDataSource;
  final NetworkInfo networkInfo;
  AuthrepositoryImpl(
      {required this.implAuthRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, UserCredential>> signIn(String email, password) async {
    if (await networkInfo.isConnected) {
      try {
        UserCredential userCredential =
            await implAuthRemoteDataSource.signIn(email, password);
        return right(userCredential);
      } on EmailException {
        return left(SignInFailure());
      } on PasswordException {
        left(SignInFailure());
      }
    } else {
      return left(ServerFailure());
    }
    return left(ServerFailure());
  }

  @override
  Future<Either<Failure, UserCredential>> signUp(
      String password, email, userName) async {
    if (await networkInfo.isConnected) {
      try {
        UserCredential userCredential =
            await implAuthRemoteDataSource.signUp(email, password, userName);
        return right(userCredential);
      } on EmailException {
        return left(SignUpFailure());
      } on WeekPasswordException {
        return left(WeekPasswordFailure());
      } on EmailIUseException {
        return left(EmailUseFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await implAuthRemoteDataSource.signOut();
        return right(result);
      } on FirebaseException {
        return left(ServerFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }
}

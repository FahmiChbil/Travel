// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, Unit>> signIn(String email, password) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await implAuthRemoteDataSource.signIn(email, password);
        return right(unit);
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
  Future<Either<Failure, Unit>> signUp(String password, email) async {
    // TODO: implement signUp
    if (await networkInfo.isConnected) {
      try {
        final result = await implAuthRemoteDataSource.signUp(email, password);
        return right(unit);
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
}

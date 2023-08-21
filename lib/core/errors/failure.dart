import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class SignInFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class OfflinFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignUpFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class WeekPasswordFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmailUseFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

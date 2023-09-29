part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoadingAuthState extends AuthState {}

final class FailureAuthState extends AuthState {
  final String errorMessage;

  const FailureAuthState({required this.errorMessage});
}

final class SucceesAuthState extends AuthState {}

final class FailureSignUpState extends AuthState {
  final String errorMessage;

  const FailureSignUpState({required this.errorMessage});
}

final class SuccedSignUpState extends AuthState {}

final class LoadingSignUpState extends AuthState {}

final class SignOutSuccees extends AuthState {}

final class SignOutFailed extends AuthState {}

final class AdminSignInSuccess extends AuthState {}

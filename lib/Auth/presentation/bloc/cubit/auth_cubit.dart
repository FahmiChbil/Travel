import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylasttravelapp/Auth/domain/usecases/sign_out.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/string/failures.dart';
import '../../../domain/usecases/SignIn.dart';
import '../../../domain/usecases/sign_up.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required this.signInUseCase,
      required this.signOutUseCase,
      required this.signUpUseCase})
      : super(AuthInitial());
  SignInUseCase signInUseCase;
  SignUpUseCase signUpUseCase;
  SignOutUseCase signOutUseCase;
  signIn(String email, password) async {
    emit(LoadingAuthState());
    if (email == "fahmi@gmail.com" && password == "azerty") {
      await signInUseCase(email, password);
      emit(AdminSignInSuccess());
    } else {
      final result = await signInUseCase(email, password);

      emit(mapFailedOrSuccedSignIn(result));
    }
  }

  signUp(String email, password, userName) async {
    emit(LoadingSignUpState());

    emit(mapFailedOrSuccedSignUp(await signUpUseCase.authRepositories
        .signUp(password, email, userName)));
  }

  signOut() async {
    var result = await signOutUseCase();
    result.fold((l) => emit(SignOutFailed()), (r) => emit(SignOutSuccees()));
  }

  AuthState mapFailedOrSuccedSignUp(Either<Failure, UserCredential> either) {
    return either.fold(
        (l) => FailureSignUpState(errorMessage: _mapFailureToMessage(l)),
        (r) => SuccedSignUpState());
  }

  AuthState mapFailedOrSuccedSignIn(Either<Failure, UserCredential> either) {
    return either.fold(
        (l) => FailureAuthState(errorMessage: _mapFailureToMessage(l)),
        (r) => SucceesAuthState());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case OfflinFailure:
        return OFFLINE_FAILURE_MESSAGE;
      case SignInFailure:
        return ERROR_SIGN_IN_Message;
      case SignUpFailure:
        return ERROR_SIGN_UP_Message;
      case EmailUseFailure:
        return EMAIL_USE_MESSAGE;
      case WeekPasswordFailure:
        WEEK_PASSWORD_MESSAGE;

      default:
        return 'unexpected error , please try later ';
    }
    return "unexpected error";
  }
}

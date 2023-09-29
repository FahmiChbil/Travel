import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/pay_hotel.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';
import 'package:mylasttravelapp/core/string/failures.dart';

part 'pay_cubit_state.dart';

class PayCubitCubit extends Cubit<PayCubitState> {
  final PayHotelUseCase payHotelUseCase;
  PayCubitCubit({required this.payHotelUseCase}) : super(PayCubitInitial());

  payHotel(int amount, String type) async {
    final payment = await payHotelUseCase(amount, type);
    emit(mapFailedOrSuccedPayment(payment));
  }

  PayCubitState mapFailedOrSuccedPayment(Either<Failure, Unit> either) {
    return either.fold((l) => FailurePay(message: _mapFailureToMessage(l)),
        (r) => SuccessPay());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case StripeFailure:
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

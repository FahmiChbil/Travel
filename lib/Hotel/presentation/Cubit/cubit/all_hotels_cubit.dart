import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_hotels_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/string/failures.dart';

part 'all_hotels_state.dart';

class AllHotelsCubit extends Cubit<AllHotelsState> {
  GetAllHotelsUseCase getAllHotelsUseCase;

  AllHotelsCubit({required this.getAllHotelsUseCase})
      : super(AllHotelsInitial());

  getAllHotels(String docid) async {
    emit(LoadingAllHotelsState());
    final result = await getAllHotelsUseCase(docid);
    emit(mapFailedOrSuccedGetHotels(result));
  }

  AllHotelsState mapFailedOrSuccedGetHotels(Either<Failure, AllHotels> either) {
    return either.fold(
        (errormsg) =>
            FailureAllHotelsState(errorMsg: _mapFailureToMessage(errormsg)),
        (allHotels) => SuccesAllHotelsState(allHotels: allHotels));
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

// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_places.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_hotels_use_case.dart';
import 'package:mylasttravelapp/Hotel/domain/usecases/get_all_places_use_case.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';
import 'package:mylasttravelapp/core/string/failures.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  final GetAllPlacesUseCase getAllPlacesUseCase;

  HotelsCubit({
    required this.getAllPlacesUseCase,
  }) : super(HotelsInitial());

  getAllplaces() async {
    emit(LoadingState());
    final result = await getAllPlacesUseCase();

    emit(mapFailedOrSuccedGetHotels(result));
  }

  HotelsState mapFailedOrSuccedGetHotels(Either<Failure, AllPlaces> either) {
    return either.fold(
        (errormsg) => FailureState(errorMsg: _mapFailureToMessage(errormsg)),
        (allPlaces) => SuccessState(allPlaces: allPlaces));
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

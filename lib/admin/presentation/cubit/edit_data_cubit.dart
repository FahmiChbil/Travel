import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/one_hotel.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/place.dart';
import 'package:mylasttravelapp/admin/domain/usecases/add_data.dart';
import 'package:mylasttravelapp/core/errors/failure.dart';
import 'package:mylasttravelapp/core/string/failures.dart';

part 'edit_data_state.dart';

class EditDataCubit extends Cubit<EditDataState> {
  AddDataUseCase addDataUseCase;

  EditDataCubit({required this.addDataUseCase}) : super(EditDataInitial());

  addData(OneHotel oneHotel, Place place) async {
    emit(LoadingAddedData());
    var result = await addDataUseCase(oneHotel, place);
    emit(mapEitherToState(result, SUCCES_MESSAGE));
  }
}

EditDataState mapEitherToState(Either either, String message) {
  return either.fold((l) => AddedDataFailed(errormsg: _mapFailureToMessage(l)),
      (r) => AddedDataSucces(succedmsg: message));
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;

    case OfflinFailure:
      OFFLINE_FAILURE_MESSAGE;

    default:
      return 'unexpected error , please try later ';
  }
  return "unexpected error";
}

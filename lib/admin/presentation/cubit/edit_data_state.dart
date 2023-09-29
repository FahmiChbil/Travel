part of 'edit_data_cubit.dart';

sealed class EditDataState extends Equatable {
  const EditDataState();

  @override
  List<Object> get props => [];
}

final class EditDataInitial extends EditDataState {}

final class AddedDataSucces extends EditDataState {
  final String succedmsg;
  const AddedDataSucces({required this.succedmsg});
}

final class AddedDataFailed extends EditDataState {
  final String errormsg;
  const AddedDataFailed({required this.errormsg});
}

final class LoadingAddedData extends EditDataState {}

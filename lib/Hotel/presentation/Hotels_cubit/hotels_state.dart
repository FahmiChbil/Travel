part of 'hotels_cubit.dart';

sealed class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

final class HotelsInitial extends HotelsState {}

class LoadingState extends HotelsState {}

class SuccessState extends HotelsState {
  final AllPlaces allPlaces;
  const SuccessState({required this.allPlaces});
}

class FailureState extends HotelsState {
  final String errorMsg;

  const FailureState({required this.errorMsg});
}

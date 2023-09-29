part of 'all_hotels_cubit.dart';

sealed class AllHotelsState extends Equatable {
  const AllHotelsState();

  @override
  List<Object> get props => [];
}

final class AllHotelsInitial extends AllHotelsState {}

class LoadingAllHotelsState extends AllHotelsState {}

class SuccesAllHotelsState extends AllHotelsState {
  final AllHotels allHotels;
  const SuccesAllHotelsState({required this.allHotels});
}

class FailureAllHotelsState extends AllHotelsState {
  final String errorMsg;

  const FailureAllHotelsState({required this.errorMsg});
}

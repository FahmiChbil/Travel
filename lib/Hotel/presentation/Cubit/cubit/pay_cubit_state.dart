part of 'pay_cubit_cubit.dart';

sealed class PayCubitState extends Equatable {
  const PayCubitState();

  @override
  List<Object> get props => [];
}

final class PayCubitInitial extends PayCubitState {}

class SuccessPay extends PayCubitState {}

class FailurePay extends PayCubitState {
  final String message;

  const FailurePay({required this.message});
}

part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();
  @override
  List<Object> get props => [];
}

class TransactionsStateInitial extends TransactionsState {}

class TransactionsStateLoading extends TransactionsState {}

class TransactionsStateGetAllSuccess extends TransactionsState {

  final GetAllTransactionsResponseModel responseModel;
  const TransactionsStateGetAllSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class TransactionsStateFailure extends TransactionsState {

  final String failureMessage;
  const TransactionsStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}

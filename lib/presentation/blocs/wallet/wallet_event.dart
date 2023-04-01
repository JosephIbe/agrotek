part of 'wallet_bloc.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object> get props => [];

}

class GetWalletBalanceEvent extends WalletEvent {}

class CreateTransactionPINEvent extends WalletEvent {

  final CreatePINParams params;
  const CreateTransactionPINEvent({required this.params});

  @override
  List<Object> get props => [props];

}

class GetUserBanksEvent extends WalletEvent {}

class GetAllBanksEvent extends WalletEvent {}

class AddBankDetailsEvent extends WalletEvent {

  final AddBankAccountParams params;
  const AddBankDetailsEvent({required this.params});

  @override
  List<Object> get props => [params];

}

class InitiateWithdrawalEvent extends WalletEvent {

  final InitiateWithdrawalParams params;
  const InitiateWithdrawalEvent({required this.params});

  @override
  List<Object> get props => [params];

}

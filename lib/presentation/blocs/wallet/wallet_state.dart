part of 'wallet_bloc.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];

}

class WalletStateInitial extends WalletState {}

class WalletStateLoading extends WalletState {}

class WalletStateWithdrawLoading extends WalletState {}

class WalletStateGetBalanceSuccess extends WalletState {

  final WalletBalanceResponseModel responseModel;
  const WalletStateGetBalanceSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WalletStateCreatePinSuccess extends WalletState {

  final CreatePinResponseModel responseModel;
  const WalletStateCreatePinSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WalletStateGetUserBanksSuccess extends WalletState {

  final UserBanksResponseModel responseModel;
  const WalletStateGetUserBanksSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WalletStateGetAllBanksSuccess extends WalletState {

  final BanksResponseModel responseModel;
  const WalletStateGetAllBanksSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WalletStateResolveBankSuccess extends WalletState {

  final ResolveBankResponseModel responseModel;
  const WalletStateResolveBankSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WalletStateAddBankDetailsSuccess extends WalletState {

  final UserBanksResponseModel responseModel;
  const WalletStateAddBankDetailsSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class InitiateWithdrawalSuccess extends WalletState {

  final InitiateWithdrawalResponseModel responseModel;
  const InitiateWithdrawalSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WalletStateFailure extends WalletState {

  final String errorMessage;
  const WalletStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}

part of 'kyc_bloc.dart';

abstract class KycState extends Equatable {
  const KycState();

  @override
  List<Object> get props => [];
}

class KycStateInitial extends KycState {}

class KycStateLoading extends KycState {}

class KycStateValidateBVNSuccess extends KycState {

  final ValidateBvnResponseModel responseModel;
  const KycStateValidateBVNSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class KycStateFailure extends KycState {

  final String errorMessage;
  const KycStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}
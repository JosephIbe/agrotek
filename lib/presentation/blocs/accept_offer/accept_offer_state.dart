part of 'accept_offer_bloc.dart';

abstract class AcceptOfferState extends Equatable {
  const AcceptOfferState();

  @override
  List<Object> get props => [];
}

class AcceptOfferStateInitial extends AcceptOfferState {
  @override
  List<Object> get props => [];
}

class AcceptOfferStateLoading extends AcceptOfferState {}

class AcceptOfferStateSuccess extends AcceptOfferState {

  final AcceptOfferResponseModel responseModel;
  const AcceptOfferStateSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class AcceptOfferStateFailure extends AcceptOfferState {

  final String failureMessage;
  const AcceptOfferStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}


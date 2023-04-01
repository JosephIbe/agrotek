part of 'offers_bloc.dart';

abstract class OffersState extends Equatable {
  const OffersState();
  @override
  List<Object> get props => [];
}

class OffersStateInitial extends OffersState {}

class OffersStateLoading extends OffersState {}

class OffersStateAcceptLoading extends OffersState {}

class OffersStateGetAllSuccess extends OffersState {

  final GetAllOffersResponseModel responseModel;
  const OffersStateGetAllSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class OffersStateFailure extends OffersState {

  final String failureMessage;
  const OffersStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}

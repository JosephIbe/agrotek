part of 'resolve_bloc.dart';

abstract class ResolveState extends Equatable {
  const ResolveState();

  @override
  List<Object> get props => [];

}

class ResolveStateInitial extends ResolveState {}

class ResolveStateLoading extends ResolveState {}

class ResolveStateResolveBankSuccess extends ResolveState {

  final ResolveBankResponseModel responseModel;
  const ResolveStateResolveBankSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class ResolveStateFailure extends ResolveState {

  final String errorMessage;
  const ResolveStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}

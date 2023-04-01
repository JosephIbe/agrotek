part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];

}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateLoginSuccess extends AuthState {

  final FarmerAggregatorLoginResponseModel responseModel;
  const AuthStateLoginSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class AuthStateRegisterSuccess extends AuthState {

  final RegisterResponseModel responseModel;
  const AuthStateRegisterSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class AuthStateFailure extends AuthState {

  final String failureMessage;
  const AuthStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}

class AuthStateGenerateOTPSuccess extends AuthState {

  final GenerateOtpResponseModel responseModel;
  const AuthStateGenerateOTPSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class AuthStateForgotPasswordSuccess extends AuthState {}

class AuthStateChangePasswordSuccess extends AuthState {}

class VerifyOTPStateSuccess extends AuthState {}

class VerifyOTPStateFailure extends AuthState {}

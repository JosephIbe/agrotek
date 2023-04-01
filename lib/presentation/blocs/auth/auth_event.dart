part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];

}

class LoginEvent extends AuthEvent {

  final LoginParams loginParams;
  const LoginEvent({required this.loginParams});

}

class RegisterUserEvent extends AuthEvent {

  final FarmerRegisterParams registerParams;
  const RegisterUserEvent({required this.registerParams});

}

class ForgotPasswordEvent extends AuthEvent {
  final dynamic params;
  const ForgotPasswordEvent({required this.params});

  @override
  List<Object?> get props =>  [params];

}

class ChangePasswordEvent extends AuthEvent {

  final dynamic params;
  const ChangePasswordEvent({required this.params});

  @override
  List<Object?> get props =>  [params];

}

class GenerateOTPEvent extends AuthEvent {

  final GenerateOTPParams params;
  const GenerateOTPEvent({required this.params});

}

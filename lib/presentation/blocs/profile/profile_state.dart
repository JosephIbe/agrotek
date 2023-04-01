part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];

}

class ProfileStateInitial extends ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateGetProfileSuccess extends ProfileState {

  final ProfileResponseModel responseModel;
  const ProfileStateGetProfileSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class ProfileStateFailure extends ProfileState {

  final String failureMessage;
  const ProfileStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}
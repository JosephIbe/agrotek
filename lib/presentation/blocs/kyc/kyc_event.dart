part of 'kyc_bloc.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();

  @override
  List<Object?> get props => [];
}

class ValidateBVNEvent extends KycEvent {

  final String bvn;
  const ValidateBVNEvent({required this.bvn});

  @override
  List<Object?> get props => [];
}

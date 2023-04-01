import 'package:equatable/equatable.dart';

class CreatePINParams extends Equatable {

  final String password;
  final String code;
  final String transactionPIN;
  final String walletId;
  final String otpChannel;

  const CreatePINParams({
    required this.password,
    required this.code,
    required this.transactionPIN,
    required this.walletId,
    required this.otpChannel,
  });

  Map<String, dynamic> toJson() => {
    "password": password,
    "code": code,
    "transaction_pin": transactionPIN,
    "wallet_id": walletId,
    "otp_channel": otpChannel
  };

  @override
  List<Object?> get props => [password, code, transactionPIN, walletId, otpChannel];

}
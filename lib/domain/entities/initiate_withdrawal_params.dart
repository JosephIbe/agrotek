import 'package:equatable/equatable.dart';

class InitiateWithdrawalParams extends Equatable {

  final String accountNumber;
  final String bankCode;
  final String bankName;
  final String amount;
  final String accountName;
  final String? narration;
  final String transactionPin;

  const InitiateWithdrawalParams({
    required this.accountNumber,
    required this.bankCode,
    required this.bankName,
    required this.amount,
    required this.accountName,
    this.narration,
    required this.transactionPin,
  });

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "bank_code": bankCode,
    "bank_name": bankName,
    "amount": amount,
    "account_name": accountName,
    "naration": narration,
    "transaction_pin":transactionPin
  };

  @override
  List<Object?> get props => [accountNumber, bankCode, bankName, amount, accountName, narration, transactionPin];

}
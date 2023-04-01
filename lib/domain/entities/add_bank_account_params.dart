import 'package:equatable/equatable.dart';

class AddBankAccountParams extends Equatable {

  final String accountName;
  final String accountNumber;
  final String bankName;
  final String bankCode;

  const AddBankAccountParams({
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
    required this.bankCode,
  });

  Map<String, dynamic> toJson() => {
    "bank_account": {
      "account_name": accountName,
      "account_number": accountNumber,
      "bank_code": bankCode,
      "bank_name": bankName
    }
  };

  @override
  List<Object?> get props => [
    accountName,
    accountNumber,
    bankName,
    bankCode
  ];

}
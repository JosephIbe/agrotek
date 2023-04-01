import 'package:equatable/equatable.dart';

class ResolveBankAccountParams extends Equatable {

  final String accountNumber;
  final String bankCode;

  const ResolveBankAccountParams({
    required this.accountNumber,
    required this.bankCode,
  });

  Map<String, dynamic> toJson() => {
    "account_number": accountNumber,
    "bank_code": bankCode
  };

  @override
  List<Object?> get props => [
    accountNumber,
    bankCode
  ];

}
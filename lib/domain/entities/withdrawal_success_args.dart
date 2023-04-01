import 'package:equatable/equatable.dart';

class WithdrawalSuccessfulArguments extends Equatable{

  final dynamic amount;
  final dynamic bankName;

  const WithdrawalSuccessfulArguments({
    required this.amount,
    required this.bankName,
  });

  @override
  List<Object?> get props => [amount, bankName];

}
import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/domain/entities/create_pin_params.dart';
import 'package:agenpo/domain/entities/initiate_withdrawal_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';

abstract class WalletRepository {
  Future<dynamic> getWalletBalance();
  Future<dynamic> createTransactionPIN({required CreatePINParams params});
  Future<dynamic> getBankLists();
  Future<dynamic> getUserBanks();
  Future<dynamic> resolveBankAccount({required ResolveBankAccountParams params});
  Future<dynamic> addBankDetails({required AddBankAccountParams params});
  Future<dynamic> initiateWithdrawal({required InitiateWithdrawalParams params});
}
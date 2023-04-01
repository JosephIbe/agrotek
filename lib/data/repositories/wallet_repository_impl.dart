import 'package:agenpo/data/data_sources/wallet_remote_data_source.dart';
import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/domain/entities/create_pin_params.dart';
import 'package:agenpo/domain/entities/initiate_withdrawal_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';
import 'package:agenpo/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl extends WalletRepository {

  final WalletRemoteDataSource dataSource;
  WalletRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> addBankDetails({required AddBankAccountParams params}) async {
    return await dataSource.addBankDetails(params: params);
  }

  @override
  Future<dynamic> createTransactionPIN({required CreatePINParams params}) async {
    return await dataSource.createTransactionPIN(params: params);
  }

  @override
  Future<dynamic> getBankLists() async {
    return await dataSource.getBankLists();
  }

  @override
  Future<dynamic> getUserBanks() async {
    return await dataSource.getUserBanks();
  }

  @override
  Future<dynamic> resolveBankAccount({required ResolveBankAccountParams params}) async {
    return await dataSource.resolveBankAccount(params: params);
  }

  @override
  Future<dynamic> getWalletBalance() async {
    return await dataSource.getWalletBalance();
  }

  @override
  Future<dynamic> initiateWithdrawal({required InitiateWithdrawalParams params}) async {
    return await dataSource.initiateWithdrawal(params: params);
  }

}
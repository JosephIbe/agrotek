import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';
import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/domain/entities/create_pin_params.dart';
import 'package:agenpo/domain/entities/initiate_withdrawal_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';

abstract class WalletRemoteDataSource {
  Future<dynamic> getWalletBalance();
  Future<dynamic> createTransactionPIN({required CreatePINParams params});
  Future<dynamic> getBankLists();
  Future<dynamic> getUserBanks();
  Future<dynamic> resolveBankAccount({required ResolveBankAccountParams params});
  Future<dynamic> addBankDetails({required AddBankAccountParams params});
  Future<dynamic> initiateWithdrawal({required InitiateWithdrawalParams params});
}

class WalletRemoteDataSourceImpl extends WalletRemoteDataSource {

  final APIClient client;
  WalletRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getWalletBalance() async {
    return await client.getWalletBalance();
  }

  @override
  Future<dynamic> createTransactionPIN({required CreatePINParams params}) async {
    return await client.createTransactionPIN(
        pathSegment: APIConstants.createTransactionPIN,
        params: params
    );
  }

  @override
  Future<dynamic> getBankLists() async {
    return await client.getBanks(pathSegment: APIConstants.getBanks);
  }

  @override
  Future<dynamic> getUserBanks() async {
    return await client.getUserBanks(pathSegment: APIConstants.getUserBanks);
  }

  @override
  Future<dynamic> addBankDetails({required AddBankAccountParams params}) async {
    return await client.addBankDetails(pathSegment: APIConstants.userBanks, params: params);
  }

  @override
  Future<dynamic> resolveBankAccount({required ResolveBankAccountParams params}) async {
    return await client.resolveBankDetails(pathSegment: APIConstants.resolveBank, params: params);
  }

  @override
  Future<dynamic> initiateWithdrawal({required InitiateWithdrawalParams params}) async {
    return await client.initiateWithdrawal(pathSegment: APIConstants.initiateWithdrawal, params: params);
  }

}
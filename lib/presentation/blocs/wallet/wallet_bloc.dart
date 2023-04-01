import 'dart:async';
import 'dart:convert';

import 'package:agenpo/common/db_constants.dart';

import 'package:agenpo/data/models/banks_response_model.dart';
import 'package:agenpo/data/models/create_pin_response_model.dart';
import 'package:agenpo/data/models/error_response_model.dart';
import 'package:agenpo/data/models/initiate_withdrawal_response_model.dart';
import 'package:agenpo/data/models/resolve_bank_response_model.dart';
import 'package:agenpo/data/models/user_banks_response_model.dart';
import 'package:agenpo/data/models/wallet_balance_response_model.dart';

import 'package:agenpo/domain/entities/add_bank_account_params.dart';
import 'package:agenpo/domain/entities/create_pin_params.dart';
import 'package:agenpo/domain/entities/initiate_withdrawal_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';

import 'package:agenpo/domain/repositories/wallet_repository.dart';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {

  final WalletRepository _repository;

  WalletBloc({required WalletRepository repository})
      : _repository = repository,
        super(WalletStateInitial()) {
    on<GetWalletBalanceEvent>(_getWalletBalance);
    on<CreateTransactionPINEvent>(_createTransactionPIN);
    on<GetUserBanksEvent>(_getUserBanks);
    on<GetAllBanksEvent>(_getAllBanks);
    on<AddBankDetailsEvent>(_addBankDetails);
    on<InitiateWithdrawalEvent>(_initiateWithdrawal);
  }

  _getWalletBalance(GetWalletBalanceEvent event, Emitter<WalletState> emit) async {
    emit(WalletStateLoading());

    http.Response response = await _repository.getWalletBalance();

    if(response.statusCode == 200){
      print('get wallet balance response in bloc:\n$response');

      final responseModel = WalletBalanceResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.toJson()}');

      emit(WalletStateGetBalanceSuccess(responseModel: responseModel));

    } else {
      print('get wallet balance response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WalletStateFailure(errorMessage: failure.msg));
    }

  }

  _createTransactionPIN(CreateTransactionPINEvent event, Emitter<WalletState> emit) async {
    emit(WalletStateLoading());

    final params = CreatePINParams(
      password: event.params.password,
      code: event.params.code,
      walletId: event.params.walletId,
      otpChannel: event.params.otpChannel,
      transactionPIN: event.params.transactionPIN,
    );

    http.Response response = await _repository.createTransactionPIN(params: params);

    if(response.statusCode == 200){
      print('create transaction pin response in bloc:\n$response');

      final responseModel = CreatePinResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data.toJson()}');

      Hive.box(DBConstants.appBoxName).delete(DBConstants.hasTransactionPIN);
      Hive.box(DBConstants.appBoxName).put(DBConstants.hasTransactionPIN, responseModel.data.hasPin);

      emit(WalletStateCreatePinSuccess(responseModel: responseModel));

    } else {
      print('create transaction pin response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WalletStateFailure(errorMessage: failure.msg));
    }

  }

  _getUserBanks(GetUserBanksEvent event, Emitter<WalletState> emit) async {
    emit(WalletStateLoading());

    http.Response response = await _repository.getUserBanks();

    if(response.statusCode == 200){
      print('get user banks response in bloc:\n$response');

      final responseModel = UserBanksResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.toJson()}');

      emit(WalletStateGetUserBanksSuccess(responseModel: responseModel));

    } else {
      print('get user banks response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WalletStateFailure(errorMessage: failure.msg));
    }

  }

  _getAllBanks(GetAllBanksEvent event, Emitter<WalletState> emit) async {
    emit(WalletStateLoading());

    http.Response response = await _repository.getBankLists();

    if(response.statusCode == 200){
      print('get all banks response in bloc:\n$response');

      final responseModel = BanksResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.toJson()}');

      emit(WalletStateGetAllBanksSuccess(responseModel: responseModel));

    } else {
      print('get all banks response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WalletStateFailure(errorMessage: failure.msg));
    }

  }

  _addBankDetails(AddBankDetailsEvent event, Emitter<WalletState> emit) async {
    emit(WalletStateLoading());

    final params = AddBankAccountParams(
      accountName: event.params.accountName,
      accountNumber: event.params.accountNumber,
      bankCode: event.params.bankCode,
      bankName: event.params.bankName
    );

    http.Response response = await _repository.addBankDetails(params: params);

    if(response.statusCode == 201){
      print('add bank details response in bloc:\n$response');

      final responseModel = UserBanksResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data}');

      emit(WalletStateAddBankDetailsSuccess(responseModel: responseModel));

    } else {
      print('add bank details response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WalletStateFailure(errorMessage: failure.msg));
    }

  }

  _initiateWithdrawal(InitiateWithdrawalEvent event, Emitter<WalletState> emit) async {
    emit(WalletStateWithdrawLoading());

    final params = InitiateWithdrawalParams(
      accountNumber: event.params.accountNumber,
      accountName: event.params.accountName,
      bankCode: event.params.bankCode,
      bankName: event.params.bankName,
      amount: event.params.amount,
      transactionPin: event.params.transactionPin,
      narration: event.params.narration ?? "No Narration Supplied"
    );

    http.Response response = await _repository.initiateWithdrawal(params: params);

    if(response.statusCode == 200 || response.statusCode == 201){
      print('initiate withdrawal response in bloc:\n$response');

      final responseModel = InitiateWithdrawalResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data.toJson()}');

      emit(InitiateWithdrawalSuccess(responseModel: responseModel));

    } else {
      print('initiate withdrawal response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WalletStateFailure(errorMessage: failure.msg));
    }

  }

}
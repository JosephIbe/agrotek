import 'dart:async';
import 'dart:convert';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/data/models/banks_response_model.dart';

import 'package:agenpo/data/models/create_pin_response_model.dart';
import 'package:agenpo/data/models/error_response_model.dart';
import 'package:agenpo/data/models/resolve_bank_response_model.dart';
import 'package:agenpo/data/models/user_banks_response_model.dart';
import 'package:agenpo/domain/entities/add_bank_account_params.dart';

import 'package:agenpo/domain/entities/create_pin_params.dart';
import 'package:agenpo/domain/entities/resolve_bank_account_params.dart';

import 'package:agenpo/domain/repositories/wallet_repository.dart';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'resolve_event.dart';
part 'resolve_state.dart';

class ResolveBloc extends Bloc<ResolveEvent, ResolveState> {

  final WalletRepository _repository;

  ResolveBloc({required WalletRepository repository})
      : _repository = repository,
        super(ResolveStateInitial()) {
    on<ResolveBankAccountEvent>(_resolveBankAccount);
  }

  _resolveBankAccount(ResolveBankAccountEvent event, Emitter<ResolveState> emit) async {
    emit(ResolveStateLoading());

    final params = ResolveBankAccountParams(
      accountNumber: event.params.accountNumber,
      bankCode: event.params.bankCode,
    );

    http.Response response = await _repository.resolveBankAccount(params: params);

    if(response.statusCode == 200){
      print('resolve bank details response in bloc:\n$response');

      final responseModel = ResolveBankResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data}');

      emit(ResolveStateResolveBankSuccess(responseModel: responseModel));

    } else {
      print('resolve bank details response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(ResolveStateFailure(errorMessage: failure.msg));
    }

  }

}
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:agenpo/common/db_constants.dart';
import 'package:agenpo/data/models/error_response_model.dart';

import 'package:agenpo/data/models/generate_otp_response_model.dart';
import 'package:agenpo/data/models/farmer_aggregator_login_response_model.dart';
import 'package:agenpo/data/models/register_response_model.dart';

import 'package:agenpo/domain/entities/farmer_register_params.dart';
import 'package:agenpo/domain/entities/generate_otp_params.dart';
import 'package:agenpo/domain/entities/login_params.dart';
import 'package:agenpo/domain/repositories/auth_repository.dart';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthRepository _repository;

  AuthBloc({required AuthRepository repository})
      : _repository = repository,
        super(AuthStateInitial()) {
    on<LoginEvent>(_loginFarmerAggregator);
    on<RegisterUserEvent>(_registerUser);
    on<GenerateOTPEvent>(_generateOTP);
  }

  _loginFarmerAggregator(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    print('login params in bloc :\n${event.loginParams}');

    http.Response response = await _repository.loginUser(params: event.loginParams);

    final box = Hive.box(DBConstants.appBoxName);

    if(response.statusCode == 200){
      log('login response in bloc:\n$response');

      final loginResponseModel = FarmerAggregatorLoginResponseModel.fromJson(jsonDecode(response.body));

      box.put(DBConstants.userId, loginResponseModel.user.id);
      box.put(DBConstants.email, loginResponseModel.user.email);
      box.put(DBConstants.token, loginResponseModel.token);
      box.put(DBConstants.userReferenceNumber, loginResponseModel.user.userRef);
      box.put(DBConstants.isBVNVerified, loginResponseModel.user.isBvnVerified);
      box.put(DBConstants.userRoleOrType, loginResponseModel.user.role);
      box.put(DBConstants.walletBalance, loginResponseModel.user.wallet.availableBalance);
      box.put(DBConstants.walletId, loginResponseModel.user.wallet.id);
      box.put(DBConstants.hasTransactionPIN, loginResponseModel.user.wallet.hasPin);

      emit(AuthStateLoginSuccess(responseModel: loginResponseModel));

    } else {

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(AuthStateFailure(failureMessage: failure.msg));
    }

  }

  _registerUser(RegisterUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    print('register params in bloc :\n${event.registerParams}');

    http.Response response = await _repository.registerUser(params: event.registerParams);

    final box = Hive.box(DBConstants.appBoxName);

    if(response.statusCode == 201){
      print('register response in bloc:\n$response');

      final responseModel = RegisterResponseModel.fromJson(jsonDecode(response.body));
      print(responseModel.data.toJson());

      emit(AuthStateRegisterSuccess(responseModel: responseModel));

    } else {
      print('register response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(AuthStateFailure(failureMessage: failure.msg));
    }

  }

  _generateOTP(GenerateOTPEvent event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    print('generate otp params in bloc :\n${event.params}');

    http.Response response = await _repository.generateOTP(params: event.params);

    if(response.statusCode == 201){
      print('generate otp response in bloc:\n$response');

      final responseModel = GenerateOtpResponseModel.fromJson(jsonDecode(response.body));
      print('otp data\n');
      print(responseModel.data.toJson());

      emit(AuthStateGenerateOTPSuccess(responseModel: responseModel));

    } else {
      print('generate otp response status code:\t${response.statusCode}');

      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(AuthStateFailure(failureMessage: failure.msg));

    }

  }

}
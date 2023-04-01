import 'dart:async';
import 'dart:convert';

import 'package:agenpo/data/data_sources/validate_bvn_response_model.dart';
import 'package:agenpo/data/models/error_response_model.dart';

import 'package:agenpo/domain/repositories/kyc_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'kyc_event.dart';
part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {

  final KYCRepository _repository;

  KycBloc({required KYCRepository repository})
      : _repository = repository, super(KycStateInitial()) {
    on<ValidateBVNEvent>(_validateBVN);
  }

  _validateBVN(ValidateBVNEvent event, Emitter<KycState> emit) async {
    emit(KycStateLoading());

    http.Response response = await _repository.validateBVN(bvn: event.bvn);

    if(response.statusCode == 200){
      print('validate bvn response in bloc:\n$response');

      final responseModel = ValidateBvnResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data}');

      emit(KycStateValidateBVNSuccess(responseModel: responseModel));

    } else {
      print('validate bvn response status code:\t${response.statusCode}');
      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(KycStateFailure(errorMessage: failure.msg));
    }

  }
}

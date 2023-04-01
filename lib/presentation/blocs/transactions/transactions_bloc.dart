import 'dart:convert';

import 'package:agenpo/data/models/error_response_model.dart';
import 'package:agenpo/data/models/get_all_transactions_response_model.dart';

import 'package:agenpo/domain/repositories/transactions_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {

  TransactionsRepository _repository;

  TransactionsBloc({required TransactionsRepository repository})
      : assert (repository != null), _repository = repository,
        super(TransactionsStateInitial()) {
    on<GetAllTransactionsEvent>(_getAllTransactions);
  }

  _getAllTransactions(TransactionsEvent event, Emitter<TransactionsState> emit) async {
    emit(TransactionsStateLoading());

    http.Response response = await _repository.getAllTransactions();

    if(response.statusCode == 200){
      print('get all transactions response in bloc:\n$response');

      final responseModel = GetAllTransactionsResponseModel.fromJson(jsonDecode(response.body));
      print('responseModel data:\n${responseModel.data}');

      emit(TransactionsStateGetAllSuccess(responseModel: responseModel));

    } else {
      print('get all transactions response status code:\t${response.statusCode}');
      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(TransactionsStateFailure(failureMessage: failure.msg));
    }
  }

}

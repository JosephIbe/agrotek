import 'dart:async';
import 'dart:convert';

import 'package:agenpo/data/models/error_response_model.dart';
import 'package:agenpo/domain/repositories/warehouses_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'warehouses_event.dart';
part 'warehouses_state.dart';

class WarehousesBloc extends Bloc<WarehousesEvent, WarehousesState> {

  final WarehousesRepository _repository;

  WarehousesBloc({required WarehousesRepository repository})
      : _repository = repository,
        super(WarehousesStateInitial()) {
    on<LoadWarehouses>(_loadWarehouses);
  }

  _loadWarehouses(LoadWarehouses event, Emitter<WarehousesState> emit) async {
    emit(WarehousesStateLoading());

    http.Response response = await _repository.getWarehouses();

    if(response.statusCode == 200){
      print('get all warehouses response in bloc:\n$response');

      // final responseModel = GetAllTransactionsResponseModel.fromJson(jsonDecode(response.body));
      // print('responseModel data:\n${responseModel.data}');

      emit(const WarehousesStateGetAllSuccess(responseModel: []));

    } else {
      print('get all warehouses response status code:\t${response.statusCode}');
      final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      print('failure in bloc:\n${failure.msg}');
      emit(WarehousesStateFailure(failureMessage: failure.msg));
    }
  }

}

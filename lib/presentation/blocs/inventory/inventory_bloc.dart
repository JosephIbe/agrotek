import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:agenpo/data/models/get_all_inventory_items_response_model.dart';
import 'package:agenpo/data/models/get_single_inventory_item_response_model.dart';
import 'package:agenpo/domain/repositories/inventory_repository.dart';

import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {

  final InventoryRepository _repository;

  InventoryBloc({required InventoryRepository repository})
      : _repository = repository, super(InventoryStateInitial()) {
    on<LoadAllInventoryItems>(_loadAllInventoryItems);
    on<LoadActiveInventoryItems>(_loadActiveInventoryItems);
    on<LoadSoldOutInventoryItems>(_loadSoldOutInventoryItems);
    on<LoadSingleInventoryItem>(_loadSingleInventoryItem);
  }

  _loadAllInventoryItems(LoadAllInventoryItems event, Emitter<InventoryState> emit) async {
    emit(InventoryStateLoading());

    http.Response response = await _repository.loadAllInventoryItems();

    if(response.statusCode == 200){
      print('get all inventory items response in bloc:\n$response');

      final responseModel = GetAllInventoryItemsResponseModel.fromJson(jsonDecode(response.body));
      log('responseModel data first:\n${responseModel.data.first.toJson()}');
      //
      emit(InventoryStateGetAllSuccess(responseModel: responseModel));

    } else {
      print('get all inventory items response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const InventoryStateFailure(errorMessage: 'Could Not Get All Inventory Items'));
    }

  }

  _loadActiveInventoryItems(LoadActiveInventoryItems event, Emitter<InventoryState> emit) async {
    emit(InventoryStateLoading());

    http.Response response = await _repository.loadActiveInventoryItems();

    if(response.statusCode == 200){
      print('get active inventory items response in bloc:\n$response');

      // final responseModel = GetAllOffersResponseModel.fromJson(jsonDecode(response.body));
      // log('responseModel data:\n${responseModel.offers.first.toJson()}');

      // emit(InventoryStateGetAllSuccess(responseModel: responseModel));

    } else {
      print('get active inventory items response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const InventoryStateFailure(errorMessage: 'Could Not Get Active Inventory Items'));
    }

  }

  _loadSoldOutInventoryItems(LoadSoldOutInventoryItems event, Emitter<InventoryState> emit) async {
    emit(InventoryStateLoading());

    http.Response response = await _repository.loadSoldOutInventoryItems();

    if(response.statusCode == 200){
      print('get sold out inventory items response in bloc:\n$response');

      // final responseModel = GetAllOffersResponseModel.fromJson(jsonDecode(response.body));
      // log('responseModel data:\n${responseModel.offers.first.toJson()}');

      // emit(InventoryStateGetAllSuccess(responseModel: responseModel));

    } else {
      print('get sold out inventory items response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const InventoryStateFailure(errorMessage: 'Could Not Sold Out Inventory Items'));
    }

  }

  _loadSingleInventoryItem(LoadSingleInventoryItem event, Emitter<InventoryState> emit) async {
    emit(InventoryStateLoading());

    http.Response response = await _repository.loadSingleInventoryItem(id: event.id);

    if(response.statusCode == 200){
      print('get single inventory item response in bloc:\n$response');

      final responseModel = GetSingleInventoryItemResponseModel.fromJson(jsonDecode(response.body));
      log('responseModel data:\n${responseModel.data.toJson()}');
      //
      emit(InventoryStateGetSingleInventorySuccess(responseModel: responseModel));

    } else {
      print('get single inventory item response status code:\t${response.statusCode}');
      print(response.reasonPhrase);
      // final failure = ErrorResponseModel.fromJson(jsonDecode(response.body));
      // print('failure in bloc:\n${failure.message}');
      emit(const InventoryStateFailure(errorMessage: 'Could Not This Inventory Item'));
    }

  }

}
part of 'inventory_bloc.dart';

abstract class InventoryState extends Equatable {
  const InventoryState();

  @override
  List<Object> get props => [];

}

class InventoryStateInitial extends InventoryState {}

class InventoryStateLoading extends InventoryState {}

class InventoryStateGetAllSuccess extends InventoryState {
  final GetAllInventoryItemsResponseModel responseModel;
  const InventoryStateGetAllSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class InventoryStateGetActiveSuccess extends InventoryState {
  final dynamic responseModel;
  const InventoryStateGetActiveSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class InventoryStateGetSoldOutSuccess extends InventoryState {
  final dynamic responseModel;
  const InventoryStateGetSoldOutSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class InventoryStateGetSingleInventorySuccess extends InventoryState {
  final GetSingleInventoryItemResponseModel responseModel;
  const InventoryStateGetSingleInventorySuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class InventoryStateFailure extends InventoryState {

  final String errorMessage;
  const InventoryStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

}

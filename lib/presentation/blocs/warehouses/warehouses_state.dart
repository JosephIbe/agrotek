part of 'warehouses_bloc.dart';

abstract class WarehousesState extends Equatable {
  const WarehousesState();

  @override
  List<Object> get props => [];
}

class WarehousesStateInitial extends WarehousesState {
  @override
  List<Object> get props => [];
}

class WarehousesStateLoading extends WarehousesState {}

class WarehousesStateGetAllSuccess extends WarehousesState {

  final List<dynamic> responseModel;
  const WarehousesStateGetAllSuccess({required this.responseModel});

  @override
  List<Object> get props => [responseModel];

}

class WarehousesStateFailure extends WarehousesState {

  final String failureMessage;
  const WarehousesStateFailure({required this.failureMessage});

  @override
  List<Object> get props => [failureMessage];

}

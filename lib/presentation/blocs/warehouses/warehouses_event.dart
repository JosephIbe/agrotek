part of 'warehouses_bloc.dart';

abstract class WarehousesEvent extends Equatable {
  const WarehousesEvent();

  @override
  List<Object?> get props => [];
}

class LoadWarehouses extends WarehousesEvent {}
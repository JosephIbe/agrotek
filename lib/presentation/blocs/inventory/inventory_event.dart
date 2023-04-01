part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();

  @override
  List<Object?> get props => [];

}

class LoadAllInventoryItems extends InventoryEvent {}

class LoadActiveInventoryItems extends InventoryEvent {}

class LoadSoldOutInventoryItems extends InventoryEvent {}

class LoadSingleInventoryItem extends InventoryEvent {

  final String id;
  const LoadSingleInventoryItem({required this.id});

  @override
  List<Object?> get props => [id];

}

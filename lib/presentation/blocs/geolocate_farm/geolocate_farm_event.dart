part of 'geolocate_farm_bloc.dart';

abstract class GeolocateFarmEvent extends Equatable {
  const GeolocateFarmEvent();

  @override
  List<Object?> get props => [];
}

class GetUserLocation extends GeolocateFarmEvent {}
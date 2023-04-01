part of 'geolocate_farm_bloc.dart';

abstract class GeolocateFarmState extends Equatable {
  const GeolocateFarmState();
  @override
  List<Object> get props => [];
}

class GeolocateFarmStateInitial extends GeolocateFarmState {}

class GeolocateFarmStateLoading extends GeolocateFarmState {}

class GeolocateFarmStateSuccess extends GeolocateFarmState {
  final Position position;

  const GeolocateFarmStateSuccess({
    required this.position,
  });

  @override
  List<Object> get props => [position];
}

class GeolocateFarmStateFailure extends GeolocateFarmState {
  final String errorMessage;
  const GeolocateFarmStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

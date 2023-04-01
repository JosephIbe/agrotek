import 'dart:async';

import 'package:agenpo/domain/repositories/geolocate_farm_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocate_farm_event.dart';
part 'geolocate_farm_state.dart';

class GeolocateFarmBloc extends Bloc<GeolocateFarmEvent, GeolocateFarmState> {

  final GeoLocateFarmRepository _repository;

  GeolocateFarmBloc({required GeoLocateFarmRepository repository})
      : _repository = repository, super(GeolocateFarmStateInitial()) {
    on<GetUserLocation>(_loadLocation);
  }

  void _loadLocation(GetUserLocation event, Emitter<GeolocateFarmState> emit) async {
    final locationData = await _repository.getCurrentPosition();

    print('lat in bloc:\t${locationData.latitude}');
    print('lon in bloc:\t${locationData.longitude}');

    emit(GeolocateFarmStateSuccess(position: locationData,));

  }

}

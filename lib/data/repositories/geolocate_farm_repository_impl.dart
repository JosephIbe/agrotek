import 'package:agenpo/data/data_sources/geolocate_farm_remote_data_source.dart';

import 'package:agenpo/domain/repositories/geolocate_farm_repository.dart';

import 'package:geolocator/geolocator.dart';

class GeoLocateFarmRepositoryImpl extends GeoLocateFarmRepository {

  final GeoLocateFarmRemoteDataSource dataSource;
  GeoLocateFarmRepositoryImpl({required this.dataSource});

  @override
  Future<Position> getCurrentPosition() async {
    return await dataSource.getCurrentPosition();
  }
}
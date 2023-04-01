import 'package:geolocator/geolocator.dart';

abstract class GeoLocateFarmRepository {
  Future<Position> getCurrentPosition();
}
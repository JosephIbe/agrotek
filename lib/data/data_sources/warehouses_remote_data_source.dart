import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';

abstract class WarehousesRemoteDataSource {
  Future<dynamic> getWarehouses();
}

class WarehousesRemoteDataSourceImpl extends WarehousesRemoteDataSource {

  final APIClient client;
  WarehousesRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> getWarehouses() async {
    return await client.getWarehouses(pathSegment: APIConstants.getWarehouses);
  }

}
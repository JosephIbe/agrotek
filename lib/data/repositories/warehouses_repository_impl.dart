import 'package:agenpo/data/data_sources/warehouses_remote_data_source.dart';
import 'package:agenpo/domain/repositories/warehouses_repository.dart';

class WarehousesRepositoryImpl extends WarehousesRepository {

  final WarehousesRemoteDataSource dataSource;
  WarehousesRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> getWarehouses() async {
    return await dataSource.getWarehouses();
  }

}
import 'package:agenpo/data/data_sources/inventory_remote_data_source.dart';
import 'package:agenpo/domain/repositories/inventory_repository.dart';

class InventoryRepositoryImpl extends InventoryRepository {

  final InventoryRemoteDataSource dataSource;
  InventoryRepositoryImpl({required this.dataSource});

  @override
  Future<dynamic> loadActiveInventoryItems() async {
    return await dataSource.loadActiveInventoryItems();
  }

  @override
  Future<dynamic> loadAllInventoryItems() async {
    return await dataSource.loadAllInventoryItems();
  }

  @override
  Future<dynamic> loadSingleInventoryItem({required String id}) async {
    return await dataSource.loadSingleInventoryItem(id: id);
  }

  @override
  Future<dynamic> loadSoldOutInventoryItems() async {
    return await dataSource.loadSoldOutInventoryItems();
  }
}
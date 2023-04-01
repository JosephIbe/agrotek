import 'package:agenpo/data/core/api_client.dart';
import 'package:agenpo/data/core/api_constants.dart';

abstract class InventoryRemoteDataSource {
  Future<dynamic> loadAllInventoryItems();
  Future<dynamic> loadActiveInventoryItems();
  Future<dynamic> loadSoldOutInventoryItems();
  Future<dynamic> loadSingleInventoryItem({required String id});
}

class InventoryRemoteDataSourceImpl extends InventoryRemoteDataSource {

  final APIClient client;
  InventoryRemoteDataSourceImpl({required this.client});

  @override
  Future<dynamic> loadActiveInventoryItems() async {
    return await client.getActiveInventoryItems(pathSegment: APIConstants.getActiveInventoryItems);
  }

  @override
  Future<dynamic> loadAllInventoryItems() async {
    return await client.getAllInventoryItems(pathSegment: APIConstants.getAllInventoryItems);
  }

  @override
  Future<dynamic> loadSingleInventoryItem({required String id}) async {
    return await client.getSingleInventoryItem(pathSegment: APIConstants.getSingleInventoryItem(id: id));
  }

  @override
  Future<dynamic> loadSoldOutInventoryItems() async {
    return await client.getSoldOutInventoryItems(pathSegment: APIConstants.getSoldOutInventoryItems);
  }

}
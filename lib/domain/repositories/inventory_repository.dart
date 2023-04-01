abstract class InventoryRepository {
  Future<dynamic> loadAllInventoryItems();
  Future<dynamic> loadActiveInventoryItems();
  Future<dynamic> loadSoldOutInventoryItems();
  Future<dynamic> loadSingleInventoryItem({required String id});
}